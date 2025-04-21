return {

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",

        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    buffer_close_icon = "",
                    truncate_names = true,
                    show_close_icon = false,
                    show_buffer_close_icons = false,
                },
            })
        end,
    },
}
