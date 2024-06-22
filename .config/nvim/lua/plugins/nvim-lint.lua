return {
	-- { "williamboman/mason.nvim" },
	{
		-- https://github.com/mfussenegger/nvim-lint
		"mfussenegger/nvim-lint",
		version = "*",
		dependencies = {},
		lazy = true,
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				yaml = { "yamllint" },
				go = { "golangcilint" },
				shell = { "shellcheck" },
				python = { "mypy", "vulture" },
				-- markdown = { 'vale', }
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {},
		config = function()
			require("mason-nvim-lint").setup({
				automatic_installation = false,
				ensure_installed = {
					"yamllint",
					"shellcheck",
					-- "golangci-lint",
					"mypy",
					"vulture",
				},
			})
		end,
	},
}
