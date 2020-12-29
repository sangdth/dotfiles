set nocompatible     " be iMproved, required
filetype off         " required

 call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug '/usr/local/opt/fzf'
Plug 'SirVer/ultisnips'
Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'thaerkh/vim-workspace'
Plug 'pechorin/any-jump.vim'
Plug 'wakatime/vim-wakatime'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'leafgarland/typescript-vim'
" Plug 'pantharshit00/vim-prisma'
" Plug 'sangdth/tapilu-snippets'

call plug#end()
" Put your non-Plugin stuff after this

set background=dark
colorscheme onedark

" set guifont=Furamono\ Nerd\ Font:h14
" used plus to help coc-yank cross vim instance
set clipboard=unnamedplus
" Enhance command-line completion
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
" set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set fileformat=unix

set ttimeoutlen=10
" Don’t add empty newlines at the end of files
set binary
set noeol

" Highlight current line, could slow down vim
" set cursorline

" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set undodir=~/.vim/undo
" set nohidden
" Don’t create backups when editing files in certain directories
" set backupskip=/tmp/*,/private/tmp/*

set synmaxcol=140
" Respect modeline in files
set modeline
set modelines=4
" set lazyredraw " Why it makes slower than redraw?
" set redrawtime=10000
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
" syntax on
" filetype plugin on
filetype indent on
" syntax sync minlines=64  " this slow things?
set nocursorcolumn
" Make tabs as wide as two spaces
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent
set smartindent
set complete-=i " do not parse included files in autocomplete
set autoread
set noautowrite
" set autowrite
" set preserveindent
" make cmdline tab completion similar to bash
" set wildmode=list:longest,full
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
" set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Set no visual bell
set novisualbell
" Don’t reset cursor to start of line when moving around.
set nostartofline
" dont break word in new line
set linebreak
" Don’t show the intro message when starting Vim
" set shortmess=atI
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Not show the current mode
set noshowmode
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=1
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=150
" don't give |ins-completion-menu| messages.

set foldmethod=syntax " set the fold by language
set foldenable
set foldlevel=20 " Bigger than 20 does not work

set shortmess+=c
" always show signcolumns
" set signcolumn=yes
" Mu custom corlos
" hi clear SignColumn
" hi clear LineNr
" hi clear VertSplit

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

set noswapfile 
set nobackup
set noundofile
set nowritebackup

let g:python3_host_prog='/usr/local/opt/python/libexec/bin/python'
let g:ruby_host_prog='/Users/sangdth/.rbenv/shims/gem'
let g:loaded_perl_provider=0
let g:loaded_python_provider=0

" let g:indentLine_char='▏'
" let g:indentLine_color_gui='#333444'
" let g:indentLine_first_char =''
" let g:indentLine_showFirstIndentLevel=0
" let g:indentLine_faster=1

" Fix the folder color orange
highlight! link NERDTreeFlags NERDTreeDir
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.hg', '\.svn', '\.bzr', '\.DS_Store']

let g:NERDTreeChDirMode=3
let g:NERDTreeDirArrowExpandable=''
let g:NERDTreeDirArrowCollapsible=''
let g:NERDTreeHighlightCursorline=0
let NERDTreeShowBookmarks=0
let g:NERDTreeFileExtensionHighlightFullName=1
let g:NERDTreeExactMatchHighlightFullName=1
let g:NERDTreePatternMatchHighlightFullName=1

" let g:webdevicons_enable_nerdtree=0
" let g:DevIconsEnableFoldersOpenClose=0
" let g:WebDevIconsNerdTreeAfterGlyphPadding='  '

" let g:WebDevIconsUnicodeDecorateFolderNodes=1
" let g:DevIconsEnableFoldersOpenClose=1
" let g:DevIconsDefaultFolderOpenSymbol=''
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol=''

" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols={}
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['png']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpg']=''

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "ﳁ",
    \ "Renamed"   : "",
    \ "Unmerged"  : "",
    \ "Deleted"   : "",
    \ "Dirty"     : "",
    \ "Clean"     : "",
    \ 'Ignored'   : "",
    \ "Unknown"   : ""
    \ }

" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols={}
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package.json']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['yarn.lock']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['package-lock.json']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules']=''
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] =''

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
let g:airline_symbols.linenr = ''
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
let g:UltiSnipsExpandTrigger="<Nop>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
let g:go_fmt_command = "goimports"

" let g:polyglot_disabled = ['jsx', 'tsx']

" ############# Customize Fzf #############
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
let g:fzf_layout = { 'window': '-tabnew' }
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
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

" Remap for split-join
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
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

let g:coc_config_home = '~/.dotfiles'

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" -------------------------------------

" Add surround map
nmap <silent> as ysiw

" Dim the inactive window background
let g:diminactive_enable_focus=1

let mapleader = "ä"
" let mapleader = '\'

" Toggle NerdTree
map <c-e> :NERDTreeToggle<cr>
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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()

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
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <leader>s :ToggleWorkspace<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
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
nnoremap <silent> <space>r :CocRestart<CR>
" Remap for rename current word
nnoremap <silent> <space>rn <Plug>(coc-rename)

nnoremap <silent> <space>f :CocCommand eslint.executeAutofix<CR>

nnoremap <silent> <leader>f5 :source $MYVIMRC<cr>

command! W w
command! Q q
command! Wa wa
command! Qa qa

command! Bclose call <SID>BufcloseCloseIt()
nnoremap <silent> <space>q  :Bclose<cr>

nnoremap <silent> cl "ayiwoconsole.log('### <C-R>a: ', <C-R>a);<Esc>
nnoremap <silent> cL "ayiwOconsole.log('### <C-R>a: ', <C-R>a);<Esc>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    autocmd BufEnter,InsertLeave * :syntax sync fromstart

    autocmd VimEnter * call UpdateVimPlug()

    " autocmd BufEnter,InsertEnter * highlight CursorLine guibg=#333333 guifg=fg
    " autocmd BufLeave, InsertLeave * highlight CursorLine guibg=#121212 guifg=fg

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " autocmd FileType vue syntax sync fromstart
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " autocmd BufEnter,BufRead *.vue setfiletype  vue syntax=javascript

    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    " Open a NERDTree automatically when vim starts up if no files were specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

    " Close vim if the only window left open is a NERDTree
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    augroup nerdtreehidecwd
      autocmd!
      autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
    augroup end

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
 
    augroup golang
        au FileType go set noexpandtab
        au FileType go set shiftwidth=4
        au FileType go set softtabstop=4
        au FileType go set tabstop=4
    augroup end

    augroup updateBuffer
      " Trigegr `autoread` when files changes on disk
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
      " Notification after file change
      " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    augroup end
endif

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