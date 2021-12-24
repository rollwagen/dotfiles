set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

" vim-sensible:
"  https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

set autoindent
set smarttab
set backspace=indent,eol,start
set complete-=i
set splitbelow
set number
" set relativenumber
set mouse=a

" Make `jj` and `jk` throw you into normal mode
" https://csswizardry.com/2017/01/preparing-vim-for-apples-touch-bar/
inoremap jj <esc>
inoremap jk <esc>

" TABNINE
" set rtp+=/Users/rollwagen/.vim/manual/tabnine-vim
" set completeopt-=preview

call plug#begin('~/.vim/plugged')


	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

	Plug 'lukas-reineke/indent-blankline.nvim' " show  indentation guides 

	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-commentary'

	Plug 'vim-syntastic/syntastic'

	" Vim Wiki - https://github.com/vimwiki/vimwiki
	" Plug 'vimwiki/vimwiki', { 'on': [] } " turned off

	" Airline - status/tabline plugin https://gitjhub.com/vim-airline/vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'pprovost/vim-ps1'
	Plug 'tc50cal/vim-terminal'

call plug#end()

