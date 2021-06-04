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

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
call plug#end()

" Gruvbox config magick
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
