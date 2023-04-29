return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				-- show_end_of_line = true,
				-- --context is off by default, use this to turn it on
				-- show_current_context = false,
				-- show_current_context_start = false,
				indent = {
					char = { "┆" },
				},
			})
		end,
	},
}
