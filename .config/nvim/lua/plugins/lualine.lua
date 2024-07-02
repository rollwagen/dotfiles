local function parse_hex(int_color)
	return string.format("#%x", int_color)
end
local function get_hlgroup(name, fallback)
	if vim.fn.hlexists(name) == 1 then
		local group = vim.api.nvim_get_hl(0, { name = name })

		local hl = {
			fg = group.fg == nil and "NONE" or parse_hex(group.fg),
			bg = group.bg == nil and "NONE" or parse_hex(group.bg),
		}

		return hl
	end
	return fallback or {}
end

return {
	{
		"smiteshp/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				},
				-- separator = " 󰁔 ",
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"RRethy/nvim-base16",
			"SmiteshP/nvim-navic",
		},
		lazy = true,
		event = "VeryLazy",
		name = "lualine",
		config = function()
			require("lualine").setup({
				-- options = { theme = "gruvbox" },
				-- options = { theme = "gruvbox_dark" },
				options = { theme = "auto" },
				sections = {
					lualine_a = { { "mode", icon = "" } },
					lualine_b = { { "branch", icon = "" } },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = "󰝶 ",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", padding = { left = 1, right = 0 } },
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
							color = get_hlgroup("Comment", nil),
						},
					},
				},
				extensions = { "lazy", "toggleterm", "trouble" },
			})
		end,
	},
}
