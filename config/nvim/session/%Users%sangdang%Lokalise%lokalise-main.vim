let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Lokalise/lokalise-main
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +2 services/app/lokalise-ui/src/app/features/project/pages/Tasks/pages/NewTask/NewTaskWizard.test.tsx
badd +2 ~/Lokalise/lokalise-main/services/app/lokalise-ui/src/app/features/project/pages/Tasks/pages/NewTask/NewTaskCreationForm.tsx
badd +38 ~/Lokalise/lokalise-main/services/app/lokalise-ui/src/app/features/project/pages/Tasks/pages/NewTask/pages/NewTaskGeneralPage/NewTaskGeneralPage.tsx
badd +11 services/app/lokalise-ui/src/app/components/form/RadioContextField.tsx
badd +38 ~/Lokalise/lokalise-main/services/app/lokalise-ui/src/app/features/project/pages/Tasks/pages/NewTask/pages/NewTaskScopePage/NewTaskScopePage.tsx
argglobal
%argdel
edit services/app/lokalise-ui/src/app/components/form/RadioContextField.tsx
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/Lokalise/lokalise-main/services/app/lokalise-ui/src/app/features/project/pages/Tasks/pages/NewTask/NewTaskCreationForm.tsx
let s:l = 18 - ((17 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 02|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
