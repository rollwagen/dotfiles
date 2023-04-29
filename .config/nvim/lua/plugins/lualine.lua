return {

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"RRethy/nvim-base16",
		},
		lazy = true,
		event = "VeryLazy",
		name = "lualine",
		config = function()
			require("lualine").setup({
				-- options = { theme = "gruvbox" },
				-- options = { theme = "gruvbox_dark" },
				-- options = { theme = "base16" },
				-- options = { theme = "auto" },
				options = { theme = "iceberg_dark" },
			})
		end,
	},
}
