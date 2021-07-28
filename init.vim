syntax on
filetype plugin on

set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list
set shell=/bin/zsh

set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set nowrap
set cursorline

set noerrorbells
set showmode
set encoding=UTF-8
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hls
set showcmd
set clipboard+=unnamedplus
set relativenumber
set ignorecase
set background=dark

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" leader
let mapleader = " "

" REMAPS
" Edit ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source $MYVIMRC \| :PlugInstall<CR>

" Enter command mode immediately
nnoremap ; :

" easier beginning and end of line
nnoremap L $
nnoremap H ^

" newline in normal mode
nmap <CR><CR> o<esc>

"-------------------------------
"-- OPERATOR PENDING MAPPINGS --
"-------------------------------
" https://learnvimscriptthehardway.stevelosh.com/chapters/15.html

" change in (
:onoremap p i(
:onoremap b i{
:onoremap ab a{

" change in next (
:onoremap in( :<c-u>normal! f(vi(<cr>
" change in prev (
:onoremap il( :<c-u>normal! F)vi(<cr>

" TABS {{{
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" }}}

" WINDOWS {{{
nnoremap <leader>q :wincmd q<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" }}}

"-----------------
"-- INSERT MODE --
"-----------------
" Exit insert mode
inoremap jj <esc>

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
" Press - in any buffer to hop up to the directory listing and seek to the file you just came from. Keep bouncing to go up, up, up. Having rapid directory access available changes everything.
Plug 'tpope/vim-vinegar'
" Smart tab detection
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'neoclide/coc.nvim', " {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'mkitt/tabline.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

call plug#end()

" Gruvbox config magick
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox

" Airline
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" Fuzzy finder
nnoremap <leader>n :GFiles<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>ee :Buffers<CR>
nnoremap <leader>rr :History:<CR>

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25

source $HOME/coc.nvim
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected/all code.
xmap <leader>gs  <Plug>(coc-format-selected)
nmap <leader>gs  <Plug>(coc-format-selected)
xmap <leader>ga  :Format<CR>
nmap <leader>ga  :Format<CR>

" Syntastic default recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = [ "yamllint" ]
let g:syntastic_ignore_files = [ "\.java$" ]

" FINDING FILES
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
