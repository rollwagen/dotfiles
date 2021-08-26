set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" TABNINE
" set rtp+=/Users/rollwagen/.vim/manual/tabnine-vim
" set completeopt-=preview

call plug#begin('~/.vim/plugged')

	Plug 'lukas-reineke/indent-blankline.nvim'

	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'

	Plug 'vim-syntastic/syntastic'

	" Vim Wiki - https://github.com/vimwiki/vimwiki
	Plug 'vimwiki/vimwiki', { 'on': [] }

	" Airline - status/tabline plugin https://github.com/vim-airline/vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

call plug#end()

" vim-sensible: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
