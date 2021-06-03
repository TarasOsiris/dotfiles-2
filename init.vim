syntax on
filetype plugin on

set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set noerrorbells
set encoding=UTF-8
set nu
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set showcmd
set clipboard+=unnamedplus
set relativenumber
set ignorecase
set background=dark

" leader
let mapleader = " "

" REMAPS

" Enter command mode immediately
nnoremap ; :

" easier beginning and end of line
nnoremap L $
nnoremap H ^

"-----------------
"-- INSERT MODE --
"-----------------
" Exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>
