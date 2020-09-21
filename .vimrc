:syntax on

" Make `jj` and `jk` throw you into normal mode
" https://csswizardry.com/2017/01/preparing-vim-for-apples-touch-bar/
inoremap jj <esc>
inoremap jk <esc>

au BufRead,BufNewFile haproxy* set ft=haproxy


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Initialize plugin system

" Make sure you use single quotes

" Syntax highlighting for Powershell
Plug 'pprovost/vim-ps1'

call plug#end()
