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
" Edit ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" WINDOWS {{{
nnoremap <leader>h :wincmd h<CR> nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Close window
nnoremap <leader>q :wincmd q<CR>
" }}}

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
" Press - in any buffer to hop up to the directory listing and seek to the file you just came from. Keep bouncing to go up, up, up. Having rapid directory access available changes everything.
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Gruvbox config magick
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2 " open in vertical split
let g:netrw_altv=1          " open splits to the right
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25

source coc.nvim
