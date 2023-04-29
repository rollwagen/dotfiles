-- plugin will be automatically loaded when it is required somewhere
return {
	{
		"folke/which-key.nvim",
		lazy = false,
		config = function()
			require("which-key").setup()
		end,
	},
}
