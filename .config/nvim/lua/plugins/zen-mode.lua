-- https://github.com/folke/zen-mode.nvim

return {

	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			-- leave it empty to use the default settings
			width = 160, -- width of the Zen window
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				-- relativenumber = false, -- disable relative numbers
				-- cursorline = false, -- disable cursorline
				-- cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		})
	end,
}
