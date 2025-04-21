-- https://github.com/lewis6991/gitsigns.nvim

return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map("n", "]g", function()
                        if vim.wo.diff then return "]g" end
                        vim.schedule(function() gs.next_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "[GS] Next hunk" })

                    map("n", "[g", function()
                        if vim.wo.diff then return "[g" end
                        vim.schedule(function() gs.prev_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "[GS] Prev hunk" })

                    -- Actions
                    map("n", "<leader>gp", gs.preview_hunk, { desc = "[GS] Preview hunk" })
                    map("n", "<leader>gb", function() gs.blame_line({ full = true }) end)
                    map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "[GS] Toggle blame" })
                    map("n", "<leader>gd", gs.diffthis)
                    map("n", "<leader>gD", function() gs.diffthis("~") end)
                end,
            })
        end,
    },
}
