-- lazy plugin loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- options for lazy
local lazy_opts = {
	install = {
		missing = true, -- install missing plugins on startup; doesn't increase startup time.
		-- try to load one of these colorschemes when starting an installation during startup
		-- colorscheme = { "gruvbox" },
		colorscheme = { "kanagawa" },
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

-- load lazy plugins in 'plugins/'  require("lazy").setup({ { import = "plugins" } })
require("lazy").setup("plugins", lazy_opts)

-- coloscheme settings
vim.opt.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme kanagawa]])

-- :help showtabline
vim.opt.showtabline = 1

--
-- Sensible VIM settings https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
--
vim.opt.syntax = "on" -- enable syntax highlighting   vim.cmd("syntax off")
vim.opt.hidden = true -- hides buffers instead of closing them
vim.opt.backspace = "indent,eol,start"
vim.opt.encoding = "UTF-8"
vim.opt.showmatch = true -- highlight matching parenthesis
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.signcolumn = "yes" -- "yes:2", when signs are defined for a file, automatically added
vim.opt.scrolloff = 6 -- start scrolling 6 lines before end
vim.opt.textwidth = 80
vim.opt.termguicolors = true -- enable 24bit colors
vim.opt.completeopt = "menuone,noinsert,noselect,preview" -- autocomplete options

-- line & line numbers
vim.opt.number = true -- show numbers
vim.opt.relativenumber = true
vim.opt.cursorline = true -- higlight whole line cursor is on

-- search settings
vim.opt.ignorecase = true -- ignore case when searching...
vim.opt.smartcase = true -- ...be smart about intential uppercaseses
vim.opt.incsearch = true -- highlight as typing
vim.opt.hlsearch = true -- highlight all matches simultaneously

-- undue
vim.opt.swapfile = false -- don't use swapfile
vim.opt.undofile = true

-- tabs & indentation settings
vim.opt.smarttab = true -- preserve indentation for newline
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.expandtab = true -- expand tabs -> spaces
vim.opt.wrap = false -- no line wrapping
vim.opt.shiftwidth = 2 -- number of spaces to use for each step of indent.
vim.opt.tabstop = 2 -- number of spaces a TAB counts for

-- split settings & switching
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Ctrl-W Ctrl-W instead (double 'W')
-- vim.keymap.set("", "<C-j>", "<C-W>j")
-- vim.keymap.set("", "<C-k>", "<C-W>k")
-- vim.keymap.set("", "<C-l>", "<C-W>l") -- CTRL-L: Clears and redraws the screen.
-- vim.keymap.set("", "<C-h>", "<C-W>h")

-- switching to move out from terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
