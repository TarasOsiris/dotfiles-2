let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 README.md
badd +1 Session.vim
badd +1 aliases.sh
badd +185 coc.nvim
badd +1 init.sh
badd +217 init.vim
badd +1 setup.sh
badd +1 .gitignored
badd +24 .zshrc
argglobal
%argdel
$argadd README.md
$argadd Session.vim
$argadd aliases.sh
$argadd coc.nvim
$argadd init.sh
$argadd init.vim
$argadd setup.sh
edit init.vim
argglobal
if bufexists("init.vim") | buffer init.vim | else | edit init.vim | endif
if &buftype ==# 'terminal'
  silent file init.vim
endif
balt coc.nvim
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
122
normal! zo
let s:l = 217 - ((52 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 217
normal! 018|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
