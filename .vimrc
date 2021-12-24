set nocompatible
syntax enable
filetype plugin on
filetype plugin indent on

" Make `jj` and `jk` throw you into normal mode
" https://csswizardry.com/2017/01/preparing-vim-for-apples-touch-bar/
inoremap jj <esc>
inoremap jk <esc>

set splitbelow
set number
set backspace=indent,eol,start

colorscheme zenburn

" tabnine
"set rtp+=/Users/rollwagen/.vim/manual/tabnine-vim
"set completeopt-=preview

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"
" jedi-vim python completion etc
"
"Plug 'davidhalter/jedi-vim'
"autocmd FileType python setlocal completeopt-=preview


Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

"
" Syntax highlighting for Powershell
"
Plug 'pprovost/vim-ps1'

"
" Rust plugin - https://github.com/rust-lang/rust.vim
"
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'

"
" Vim Wiki - https://github.com/vimwiki/vimwiki 
"
Plug 'vimwiki/vimwiki'

"
" Airline - status/tabline plugin https://github.com/vim-airline/vim-airline
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()



"
" Airline plugin config"
"
" themes: 'simple' 'alduin' 'luna'
let g:airline_theme='luna'

" changed from default: 'fixed' width for line/col number so field doesn't dynamically extend/shrink so much e.g. %v% --> %3v%
let g:airline_section_z='%p%%%#__accent_bold#%{g:airline_symbols.linenr}%3l%#__restore__#%#__accent_bold#/%3L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%{g:airline_symbols.colnr}%3v%#__restore__#'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ''
let g:airline_symbols.maxlinenr = 'Ξ'
let g:airline_symbols.linenr = ' '


"
" Rust plugin options
"

" open the terminal output in a new tab rather than a window
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
