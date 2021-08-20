syntax on
filetype plugin on

set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set list

if (!has("win32"))
    set shell=/bin/zsh
endif

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

" LEADER (action-remove-highlighting)
let mapleader = " "

" Unfold on enter
autocmd FileType * exe "normal zR"

" {{{ REMAPS
" Edit ~/.vimrc
nnoremap <leader>av :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Enter command mode immediately
nnoremap ; :

" easier beginning and end of line
nnoremap L $
nnoremap H ^

" Copy till the end of line
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Moving lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" newline in normal mode
nmap <CR><CR> o<esc>

"-----------------
"-- INSERT MODE --
"-----------------
" Exit insert mode
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>

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
" }}}

" TABS {{{
" Go to tab by number
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)
" }}}

" WINDOWS {{{
nnoremap <leader>w :wincmd q<CR>
" Close current buffer without closing the window (from buffet plugin)
nnoremap <leader>x :Bw<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" }}}

" Buffet tabs
" Note: Make sure the function is defined before `vim-buffet` is loaded.
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=10 ctermfg=0 guibg=#00FF00 guifg=#000000
  hi! BuffetBuffer cterm=NONE ctermbg=8 ctermfg=0 guibg=#00FF00 guifg=#000000
  hi! BuffetTab cterm=NONE ctermbg=8 ctermfg=0 guibg=#00FF00 guifg=#000000
endfunction

" {{{ PLUGINS
call plug#begin('~/.vim/plugged')

" Core
Plug 'tpope/vim-sensible'
" Press - in any buffer to hop up to the directory listing and seek to the file you just came from. Keep bouncing to go up, up, up. Having rapid directory access available changes everything.
Plug 'tpope/vim-vinegar'
" Smart tab detection
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bagrat/vim-buffet'

" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

" Tools
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', " {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'

" Lang specific
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'

call plug#end()
" }}}

lua << EOF
require('telescope').load_extension('coc')
require('telescope').setup{
  defaults = {
    layout_strategy = "horizontal"
  }
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Buffet tabs plugin
let g:buffet_show_index = 1

" {{{ GRUVBOX CONFIG MAGICK
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
" }}}

" {{{ FUZZY FINDER
nnoremap <leader>n :GFiles<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>e :Buffers<CR>
" Command history
nnoremap <leader>r :History:<CR>
" }}}

" {{{ FUGITIVE
nmap <leader>ggg :Git<cr>
nmap <leader>ggs <cmd>Telescope git_status<cr>
nmap <leader>ggc :Commits!<cr>
nmap <leader>ggh :Telescope git_bcommits<cr>
nmap <leader>ggl :Gclog<cr>
nmap <leader>ggt :Git pull<CR>
nmap <leader>ggp :Git push<CR>
nmap <leader>ggd :Gvdiff<CR>

" Fugitive configuration
" Also show the commit author
let g:fugitive_summary_format = "%<(32,trunc)%an || %s"
" }}}

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize = 25

" {{{ COC
source $HOME/coc.nvim

" Remap keys for applying codeAction to the current line.
nmap <leader>ac <Plug>(coc-codeaction)
" Show info popup
nmap <leader>ai :call CocAction('doHover')<CR>
" Apply AutoFix to problem on the current line.
nmap <leader>af <Plug>(coc-fix-current)
nmap <leader>ar <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <cmd>Telescope coc references<cr>

" Formatting selected/all code.
xmap <leader>gs <Plug>(coc-format-selected)
nmap <leader>gs <Plug>(coc-format-selected)
xmap <leader>ga :Format<CR>
nmap <leader>ga :Format<CR>
" }}}

" Syntastic default recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = [ "yamllint" ]

let g:syntastic_ignore_files = [ "\.java$", "\.html$", "\.cpp$" ]

" FINDING FILES
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

let g:airline_theme='badwolf'

" Scrolling in fzf preview window
let $FZF_DEFAULT_OPTS="--bind \"ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up\""
