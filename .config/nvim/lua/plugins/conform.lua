--
-- https://github.com/stevearc/conform.nvim
--
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<space>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[CONFORM] Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			go = { "gofumpt" },
		},

		-- Set up format-on-save
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },

		-- Customize formatters
		formatters = {
			black = {
				prepend_args = { "--line-length", "140" },
			},
			stylua = {
				-- prepend_args = { "--", "--column-width", "140", "--indent_width", "2" },
			},
		},
	},

	init = function()
		-- If you want the formatexpr, here is the place to set it
		-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
