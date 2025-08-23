vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, { desc = "[LSP] Go to type definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[LSP] Go to declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[LSP] Go to definition" })

vim.diagnostic.config({

    -- virtual_lines = true,
    -- virtual_lines = {
    --     current_line = true, -- only show virtual line diag. for current cursor line
    -- },

    virtual_text = {
        prefix = "▎", -- "■", '●', '▎', 'x'
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✗", -- ""
            [vim.diagnostic.severity.WARN] = "▲", -- ""
            [vim.diagnostic.severity.INFO] = "⚑", -- "󰋼"
            [vim.diagnostic.severity.HINT] = "»", -- "󰌵", " "
        },
    },
})

-- Configure lua language server for neovim
vim.lsp.config("lua_ls", {
    settings = {},
})

-- Configure lua language server for gopls
vim.lsp.config("gopls", {
    settings = {

        gofumpt = true,
        analyses = {
            nilness = true,
            unusedparams = true,
            unusedvariable = true,
            unusedwrite = true,
            useany = true,
        },
        codelenses = {
            run_govulncheck = true,
            tidy = true,
        },
        hints = {
            -- assignVariableTypes = true,
            compositeLiteralFields = true,
            -- compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            -- rangeVariableTypes = true,
        },
    },
})

vim.lsp.config("pyright", {
    settings = {
        pyright = {
            -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
            disableOrganizeImports = true, -- using Ruff's import organizer
            disableTaggedHints = true,
        },
        python = {
            analysis = {
                ignore = { "*" }, -- ignore all files for analysis to only use Ruff for linting
                typeCheckingMode = "strict", -- basic / off / strict; off -> usign mypy
                diagnosticSeverityOverrides = {
                    -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                    reportUndefinedVariable = "none", -- ruff
                    reportUnusedVariable = "none", -- ruff
                    reportMissingImports = "none", -- ruff
                    reportOperatorIssue = "none", -- mypy
                    reportReturnType = "none", -- mypy
                    reportCallIssue = "none", -- ruff
                    reportMissingTypeStubs = "none", -- pyright
                    reportUnknownVariableType = "none",
                    reportUnknownMemberType = "none",
                    reportUnknownParameterType = "none",
                    reportUnknownArgumentType = "none",
                },
            },
            -- diagnosticMode = "openFilesOnly",  -- only show diagnostics for open files
        },
    },
})

vim.lsp.config("ruff", {
    init_options = {
        settings = { -- Ruff language server settings go here
            hoverProvider = false, -- disable hover in favor of pyright
        },
    },
})

-- vim.lsp.config("", {
--     settings = {},
-- })
