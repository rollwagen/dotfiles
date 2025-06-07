return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = function(_)
            return {
                automatic_enable = true,
            }
        end,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    -- "golangci_lint_ls",
                    -- "pylsp",
                    "pyright",
                    "ruff",
                    "terraformls",
                    "tflint",
                    "taplo", -- for toml (e.g. for pyproject.toml files)
                },
            })
        end,
    },
}
