-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				"nvim-treesitter/nvim-treesitter-context",
				"HiPhish/nvim-ts-rainbow2",
			},
		},

		opts = {
			highlight = { enable = true },
			autopairs = { enable = true },
			indent = { enable = true },
			-- context_commentstring = { enable = true, enable_autocmd = false },
			sync_install = false, -- install parsers synchronously (only applied to `ensure_installed`)
			auto_install = false, -- auto install missing parsers when entering buffer; set to false if no `tree-sitter` CLI installed

			ensure_installed = {
				"bash",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"go",
				"gomod",
			},
			incremental_selection = {
				enable = true, -- init_selection = 'gnn'
			},
			rainbow = {
				enable = true,
			},
		},

		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
