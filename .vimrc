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


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'

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

call plug#end()

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


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
