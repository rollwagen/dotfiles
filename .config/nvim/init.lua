-- Set <space> as the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy plugin loader
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- options for lazy
local lazy_opts = {
    install = {
        missing = true, -- install missing plugins on startup; doesn't increase startup time.
        -- -- colorscheme that will be used when installing plugins.
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "tokyonight-storm" },
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

-- configure lsp servers
require("lsp")

-- coloscheme settings, colorscheme plugins are in colorschema.lua
-- vim.opt.background = "dark" -- or "light" for light mode
--
-- vim.cmd([[colorscheme bamboo]])
vim.cmd([[colorscheme tokyonight]]) -- ...-night, -storm, -day, -moon
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme kanagawa]])
-- vim.cmd([[colorscheme catppuccin-macchiato]]) -- catapuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

--
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

-- Switch between windows.
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the top window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window", remap = true }) -- CTRL-L: Clears and redraws the screen.

-- Poweful <ESC>. TODO
-- vim.keymap.set({ "i", "s", "n" }, "<esc>", function()
--     if require("luasnip").expand_or_jumpable() then require("luasnip").unlink_current() end
--     vim.cmd("noh")
--     return "<esc>"
-- end, { desc = "Escape, clear hlsearch, and stop snippet session", expr = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })

vim.g.neovide_scroll_animation_length = 0.0
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_trail_size = 0.1
