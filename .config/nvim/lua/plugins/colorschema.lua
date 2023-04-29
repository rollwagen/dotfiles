return {

	-- gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				italic = {
					strings = false,
					comments = false,
					operators = false,
					folds = false,
				},
			})
		end,
	},

	-- kanagawa
	{
		"rebelot/kanagawa.nvim",
		dependencies = {},
		config = function()
			require("kanagawa").setup({
				keywordStyle = { italic = false },
			})
		end,
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
		name = "tokyonight",
	},

	-- catppuccin
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
	},
}
