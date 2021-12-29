
"syntax enable
filetype plugin on
filetype plugin indent on


" see also https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set nocompatible " default for nvim
syntax on " enable syntax highlighting
set backspace=indent,eol,start
set fileformat=unix " when using on windows
set encoding=UTF-8
set smarttab " preserve indentation for newline
set autoindent
set expandtab " tab -> spaces
set nowrap " no line wrapping
set number " show numbers
" set relativenumber
set splitbelow
set splitright
set backspace=indent,eol,start
set complete-=i
" set mouse=a
set cursorline " higlight whole line cursor is on
set signcolumn=yes " enable/display leftmost col
set scrolloff=4 " start scrolling 4 lines before end
set ignorecase " ignore case when searching...
set smartcase " ...be smart about intential uppercaseses
set incsearch " highlight as typing
set hlsearch " highlight all matches simultaneously
set textwidth=80

colorscheme zenburn

" Make `jj` and `jk` throw you into normal mode
" https://csswizardry.com/2017/01/preparing-vim-for-apples-touch-bar/
inoremap jj <esc>
inoremap jk <esc>


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

        "Plug 'davidhalter/jedi-vim'
        "autocmd FileType python setlocal completeopt-=preview


	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-commentary'


        " Syntax highlighting for Powershell
        Plug 'pprovost/vim-ps1'


        " Rust plugin - https://github.com/rust-lang/rust.vim
        " Plug 'rust-lang/rust.vim'

        Plug 'vim-syntastic/syntastic'

        " Vim Wiki - https://github.com/vimwiki/vimwiki 
        " Plug 'vimwiki/vimwiki', { 'on': [] } "turned off

        " Airline - status/tabline plugin https://github.com/vim-airline/vim-airline
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

	" Plug 'tc50cal/vim-terminal'

call plug#end()


"
" Airline plugin config"
"
" themes: 'simple' 'alduin' 'luna'
let g:airline_theme='luna'
" changed from default: 'fixed' width for line/col numbers so
" field doesn't dynamically extend/shrink so much e.g. %v% --> %3v%
let g:airline_section_z='%p%%%#__accent_bold#%{g:airline_symbols.linenr}%3l%#__restore__#%#__accent_bold#/%3L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%{g:airline_symbols.colnr}%3v%#__restore__#'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ''
let g:airline_symbols.maxlinenr = 'Ξ'
let g:airline_symbols.linenr = ' '

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


"
" Rust plugin options
"
" - open the terminal output in a new tab rather than a window
"let g:cargo_shell_command_runner = 'tab :terminal'


"
" Syntastic - https://github.com/vim-syntastic/syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_enable_signs = 1
" let g:syntastic_warning_symbol = "⚠⚠"
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '☡☡'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8', 'mypy']

let g:syntastic_markdown_mdl_exec = "markdownlint"
let g:syntastic_markdown_mdl_args = ""


"
" VimWiki config
"
autocmd BufWinEnter *.md setlocal syntax=markdown
"autocmd BufEnter \*.md setlocal syntax=markdown
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
let vimwiki_default = {}
let vimwiki_default.path = '~/vimwiki/'
let vimwiki_default.path_html = ''
let vimwiki_default.folding = 'syntax'
let vimwiki_default.syntax = 'markdown'
let vimwiki_default.ext = '.md'
let vimwiki_default.name = 'MarkdownSyntax'
let g:vimwiki_list = [vimwiki_default]
