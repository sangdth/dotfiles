filetype off                    " required

 call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psliwka/vim-smoothie'
Plug 'sangdth/tapilu-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()                       " Put your non-Plugin stuff after this

set background=dark
colorscheme onedark

filetype plugin indent on

set rtp+=/usr/local/opt/fzf           " use fzf in vim
set clipboard=unnamedplus             " used plus to help coc-yank cross vim instance
set backspace=indent,eol,start        " Allow backspace in insert mode
set ttyfast                           " Optimize for fast terminal connections

" set gdefault                        " Add the g flag to search/replace by default
set encoding=utf-8 nobomb             " Use UTF-8 without BOM
set fileformat=unix

set ttimeoutlen=10                    " Don’t add empty newlines at the end of files
set binary
set noeol

set cursorline                        " Highlight current line, could slow down vim

set modeline                          " Respect modeline in files
set modelines=4

" performance tweaks
set nocursorcolumn
set scrolljump=50
set redrawtime=1500
set synmaxcol=180                     " Stop decorate after this column number
set lazyredraw                        " Why it makes slower in some cases?
" set re=1                            " Why this cause the coc-explorer freeze when open file

" required by coc
set hidden                            " if hidden is not set, TextEdit might fail.
set nobackup
set nowritebackup
set cmdheight=1                       " Better display for messages
set updatetime=200                    " Smaller updatetime for CursorHold & CursorHoldI
set shortmess=atI                     " This one better than +=c version
set signcolumn=yes                    " always show signcolumns

set exrc                              " Enable per-directory .vimrc files
set secure                            " Disable unsafe commands in them
set number                            " Enable line numbers

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set copyindent                        " Disable if cause weird problem with indentation
set complete-=i                       " do not parse included files in autocomplete
set complete-=t                       " disable searching tags
set autoread
set noautowrite
set wildignore=*.o,*.obj,*~           " stuff to ignore when tab completing
set lcs=tab:▸\ ,trail:·,nbsp:_        " Show “invisible” characters
set hlsearch                          " Highlight searches
set ignorecase                        " Ignore case of searches
set smartcase
set incsearch                         " Highlight dynamically as pattern is typed
set mouse=a                           " Enable mouse in all modes
set noerrorbells                      " Disable error bells
set novisualbell                      " Set no visual bell
set nostartofline                     " Don’t reset cursor to start of line when moving around.
set linebreak                         " dont break word in new line
set title                             " Show the filename in the window titlebar
set showcmd                           " Show the (partial) command as it’s being typed
set noshowmode                        " Not show the current mode

set foldmethod=syntax                 " Set the fold by language instead of indent
set foldenable                        " otherwise we have to enable manually
set foldlevel=20                      " Prevent fold all at beginning, bigger than 20 does not work

set matchpairs+=<:>                   " Highlight matching pairs of brackets. Use the '%' character to jump.


if exists("&relativenumber")  
  set relativenumber                  " Use relative line numbers
  au BufReadPost * set relativenumber
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on                       " Enable syntax highlighting
endif

set noswapfile 
set noundofile

let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0
let g:loaded_python_provider=0

" Somehow we need to bring this out because it could be computer specified
let g:python3_host_prog='/usr/bin/python3'

" let g:indentLine_char='▏'
" let g:indentLine_color_gui='#333444'
" let g:indentLine_first_char =''
" let g:indentLine_showFirstIndentLevel=0
" let g:indentLine_faster=1

" Some useful icons
" "Modified"  : "",
" "Staged"    : "",
" "Untracked" : "ﳁ",
" "Renamed"   : "",
" "Unmerged"  : "",
" "Deleted"   : "",
" "Dirty"     : "",
" "Clean"     : "",
" "Info"      : "",
" "Unknown"   : "",

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_extensions=['branch', 'tabline']

let g:airline_powerline_fonts=1
let g:airline_theme='onedark'
let g:airline_highlighting_cache=1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

" let g:airline_skip_empty_sections=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch=''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''

" disable other airline extensions I do not need
let g:airline#extensions#fugitiveline#enabled=0
let g:airline#extensions#bufferline#enabled=0
let g:airline#extensions#capslock#enabled=0
let g:airline#extensions#gutentags#enabled=0
let g:airline#extensions#csv#enabled=0
let g:airline#extensions#ctrlspace#enabled=0
let g:airline#extensions#cursormode#enabled=0
let g:airline#extensions#eclim#enabled=0
let g:airline#extensions#localsearch#enabled=0
let g:airline#extensions#neomake#enabled=0
let g:airline#extensions#nrrwrgn#enabled=0
let g:airline#extensions#obsession#enabled=0
let g:airline#extensions#po#enabled=0
let g:airline#extensions#syntastic#enabled=0

let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_install_global=1
imap <expr> <c-e> emmet#expandAbbrIntelligent("\<c-e>")
let g:user_emmet_expandabbr_key='<c-e>'

" Allow JSX in normal JS files
let g:jsx_ext_required=0

let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger='<Nop>' " Use tab here will cause the conflict with coc.nvim
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

let g:LanguageClient_serverCommands={
\   'vue': ['vls']
\   }
let g:vue_disable_pre_processors=1

let g:workspace_create_new_tabs=0

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_types = 1
let g:go_fmt_command = 'goimports'

" let g:polyglot_disabled = ['jsx', 'tsx']

" ############# Customize Fzf #############
" let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_command_prefix = 'Fzf'
" let g:fzf_layout = { 'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_layout = { 'window': '-tabnew' }

let g:fzf_tags_command = 'ctags -R'             " [Tags] Command to generate tags file

" Avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
let g:plug_window='noautocmd vertical topleft new'

let g:coc_config_home = '~/.dotfiles'

" let g:coc_snippet_next = '<Tab>'
" let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
  \'coc-actions',
  \'coc-css',
  \'coc-emmet',
  \'coc-eslint',
  \'coc-git',
  \'coc-html',
  \'coc-json',
  \'coc-lists',
  \'coc-pairs',
  \'coc-smartf',
  \'coc-snippets',
  \'coc-tsserver',
  \'coc-xml',
  \'coc-yaml',
  \'coc-python',
  \]

let g:startify_change_to_dir = 0                " Do not change CWD when open files from MRU list
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_custom_header = [
\ '                                                         .                        ',
\ '                                           .            @88o                      ',
\ '       u.    u.                   _u.    88Nu.   u.     08P     ..    .     .     ',
\ '     x@88k u@88c.      .u     ...ue888b  "88888  888c    .     .888: x888  x888.  ',
\ '    ^"8888""8888"   ud8888.   888R Y888r  ^8888  8888  .@88u  ~`8888~"888X`?888f` ',
\ '      8888  888R  :888 8888.  888R I888>   8888  8888 ''888E`   X888  888X  888>  ',
\ '      8888  888R  d888  88%"  888R I888>   8888  8888   888E    X888  888X  888>  ',
\ '      8888  888R  8888.+""    888R I888>   8888  8888   888E    X888  888X  888>  ',
\ '      8888  888R  8888L      u8888cJ888   .8888b.888P   888E    X888  888X  888>  ',
\ '     "*88*  8888" "8888c. .+  "*888*P"     ^Y8888*""    888& . "*88%  *88"  888!` ',
\ '       ""   "Y"    "88888%      "Y"          `Y"        R888"    `~    "    `"`   ',
\ '                     "YP"                                ""                       ',
\ ]

let g:startify_lists = [
\ { 'type': 'files',     'header': ['   Recent opened files: ']               },
\ { 'type': 'dir',       'header': ['   Current working directory: '. getcwd()]  },
\ { 'type': 'sessions',  'header': ['   Sessions']            },
\ ]

" Mapping setup from here
" Search files
nmap <silent> sa :FzfAg<cr>
nmap <silent> si :FzfAgIn<cr>
" Search files
nmap <silent> sf :FzfFiles<cr>
" Search Git files only
nmap <silent> sg :FzfGFiles<cr>

" Search buffers
nmap <silent> sb :FzfBuffers<cr>
" Search words
nmap <silent> sh :FzfBLines<cr>
" Search words in all buffer
nmap <silent> sl :FzfLines<cr>
" Search marks
nmap <silent> sm :FzfMarks<cr>
" Search tags
nmap <silent> st :FzfTags<cr>

imap <c-t> <plug>(fzf-complete-path)

" fugitive mappings
nmap <silent> <space>gd :Gdiffsplit<CR>
nmap <silent> <space>gb :Gblame<CR>

" Jump between next and previous hunks
nmap <silent> <space>gn <Plug>(GitGutterNextHunk)
nmap <silent> <space>gp <Plug>(GitGutterPrevHunk)

" git add (chunk)
nmap <silent> <space>ga <Plug>(GitGutterStageHunk)
nmap <silent> <space>gu <Plug>(GitGutterUndoHunk)

" Remap for split-join
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nnoremap <nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir FzfFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* FzfAg
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* FzfAgIn
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview({ 'dir': expand("<cword>")}), <bang>0)
" command! -bang -nargs=? -complete=dir FzfGFiles
"  \ call fzf#vim#gfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" command! -bang Commits
"  \ call fzf#vim#commits({'right': '75%'}, <bang>0)
" ----------------- Done Customized Fzf --------------------

" ############# Snippets #############
" " Use <C-l> for trigger snippet expand.
imap <c-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <c-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" -------------------------------------

" Add surround map
nmap <silent> as ysiw

" Dim the inactive window background
let g:diminactive_enable_focus=1

let mapleader = '§'
" let mapleader = '\'

" Toggle Coc Explorer tree
nmap <c-e> :CocCommand explorer --preset staticLeft<CR>
nmap <c-f> :CocCommand explorer --preset floatingRight<CR>

map <c-b> :enew<cr>
" map <leader>qq :w<cr>:Bclose<cr>:tabclose<cr>gT
" open Explore
" map <F2> :!ls<CR>:e

" Close all the buffers
" map <leader>q :bufdo bd<cr>
" Remove highlight by shift-star

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
" Switching tab with left/right
nnoremap <silent> <Right> :bnext<cr>
nnoremap <silent> <Left> :bprevious<cr>

" Open/close and jump to next/previous "error"
" I use this as a hack for working with TODO list
nnoremap <silent> <Up> :cprev<cr>
nnoremap <silent> <Down> :cnext<cr>
nnoremap <silent> <PageUp> :copen<cr>
nnoremap <silent> <PageDown> :cclose<cr>

" Switch buffer (tab) on english keyboard
map <leader>q :Bclose<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Format Go code
nnoremap <silent> <leader>f :GoFmt<cr>

" noremap <F9> :execute 'new <bar> 0read !g++ -Wall -std=c++17 main.cpp'<cr>
" noremap <F9> :execute 'new <bar> 0read ! go run' expand("%:t")<CR>
" noremap <F9> :below new <bar> 0read ! go run #<CR>:resize 9<CR>

noremap <leader>ss :call StripWhitespace()<CR>

" Strip trailing whitespace (<leader>ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <Tab>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<Tab>" :
     \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! UpdateVimPlug() abort
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <silent> <space>qf  <Plug>(coc-fix-current)

nnoremap <leader>s :ToggleWorkspace<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show actions
nnoremap <silent> <space>a  :<C-u>CocAction<cr>
" Show all diagnostics
nnoremap <silent> <space>e  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>x  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" turn off highlight
nnoremap <silent> <space>n :noh<cr>
nnoremap <silent> <Esc><Esc> :noh<cr>
nnoremap <silent> <space>r :CocRestart<CR>
" Remap for rename current word
nnoremap <silent> <space>rn <Plug>(coc-rename)

nnoremap <silent> <space>f :CocCommand eslint.executeAutofix<CR>

nnoremap <silent> <leader>f5 :source $MYVIMRC<cr>

command! W w
command! Q q
command! Wa wa
command! Wqa wqa
command! WQa wqa
command! Qa qa

command! Bclose call <SID>BufcloseCloseIt()
nnoremap <silent> <space>q  :Bclose<cr>

nnoremap <silent> cl "ayiwoconsole.log('### <C-R>a: ', <C-R>a);<Esc>
nnoremap <silent> cL "ayiwOconsole.log('### <C-R>a: ', <C-R>a);<Esc>

" Make the color of coc-explorer fit with onedark colorscheme
hi CocExplorerNormalFloatBorder guifg=#414347 guibg=#282c34
hi CocExplorerNormalFloat guibg=#282c34

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    autocmd BufEnter,InsertLeave * :syntax sync fromstart

    autocmd VimEnter * call UpdateVimPlug()

    " autocmd BufEnter,InsertEnter * highlight CursorLine guibg=#333333 guifg=fg
    " autocmd BufLeave, InsertLeave * highlight CursorLine guibg=#121212 guifg=fg

    au BufRead,BufNewFile *.ino,*.pde set filetype=c++

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " autocmd FileType vue syntax sync fromstart
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " autocmd BufEnter,BufRead *.vue setfiletype  vue syntax=javascript

    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

    " autocmd ColorScheme *
    "   \ hi CocExplorerNormalFloatBorder guifg=#414347 guibg=#282c34
    "   \ | hi CocExplorerNormalFloat guibg=#272B34
    "   \ | hi CocExplorerSelectUI guibg=blue

    augroup QuicFixCustom
      autocmd FileType qf call <SID>MoveQuickFix()
      autocmd FileType qf map <buffer> <Del> :RemoveQFItem<cr>
    augroup end

    augroup filetype_python
      autocmd FileType python setlocal shiftwidth=4 tabstop=4
    augroup end

    augroup CocExplorerCustom
      autocmd!
      autocmd FileType coc-explorer call <SID>init_explorer()
    augroup END

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    augroup Smartf
      autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
      autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
    augroup end
 
    augroup updateBuffer
      " Trigegr `autoread` when files changes on disk
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
      " Notification after file change
      " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    augroup end

    " autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()

    " lua vim.api.nvim_command [[autocmd CursorHold   * lua require'utils'.blameVirtText()]]
    " lua vim.api.nvim_command [[autocmd CursorMoved  * lua require'utils'.clearBlameVirtText()]]
    " lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]

    " hi! link GitLens Comment
endif

" function! GetUniqueSessionName()
"   let path = fnamemodify(getcwd(), ':~:t')
"   let path = empty(path) ? 'no-project' : path
"   let branch = gitbranch#name()
"   let branch = empty(branch) ? '' : '-' . branch
"   return substitute(path . branch, '/', '-', 'g')
" endfunction

" Declare all functions after this
function! <SID>MoveQuickFix()
    wincmd L
    vertical resize 40
endfunction

" When using Delete in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
command! RemoveQFItem :call RemoveQFItem()

" Some setup for coc-explorer
function! s:init_explorer()
  if &filetype == 'coc-explorer'
    set cursorline                      " Cursor line in explorer
    set number relativenumber           " Display relative number in explorer
    set signcolumn=yes                  " Display signcolumn in coc-explorer
    setl statusline=coc-explorer
  endif
endfunction

function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799
" < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option)
" < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Fix problem with utilsnip imp module problem
" patch 8.1.0201 will fix this
if has('python3')
  silent! python3 1
endif