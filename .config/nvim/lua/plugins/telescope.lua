-- https://github.com/nvim-telescope/telescope.nvim

return {

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                        },
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[TSC] Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[TSC] Live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[TSC] List buffers" })
            vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "[TSC] Git files" })
            vim.keymap.set("n", "<leader>fh", builtin.command_history, { desc = "[TSC] Command history" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[TSC] Old/recent files" })
        end,
    },
}
