" I do not use this config anymore
" But keep it here as a good memory of beginning of time
" with pure vim

filetype off                    " required

call plug#begin('~/.vim/plugged') 
Plug '/usr/local/opt/fzf'

" ------------ Lua plugins
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-media-files.nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'yamatsum/nvim-cursorline'
" Plug 'monsonjeremy/onedark.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'alvan/vim-closetag'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'hrsh7th/nvim-compe'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-lint'
Plug 'navarasu/onedark.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'onsails/lspkind-nvim'
Plug 'phaazon/hop.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'windwp/nvim-autopairs'

" ----------- VimScript plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim' 
Plug 'AndrewRadev/tagalong.vim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'rhysd/git-messenger.vim'
Plug 'sangdth/tapilu'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
call plug#end()                        " Put your non-Plugin stuff after this

set termguicolors " Need to call before the colorizer

lua <<EOF
  require'colorizer'.setup()
  require'nvim-autopairs'.setup()
  require'lspkind'

  -- require'my-telescope'  -- super slow to grep :(
  -- require'my-efm'        -- still can not work, wtf is wrong with you mf?
  require'my-bufferline'
  require'my-compe'
  require'my-explorer'
  require'my-gitsigns'
  require'my-icons'
  require'my-linters'
  require'my-lspconfig'
  require'my-others'
  require'my-statusline'
  require'my-treesitter'
EOF

set background=light
colorscheme onedark

set guifont="FuraCode Nerd Front"
set rtp+=/usr/local/opt/fzf           " use fzf in vim
set clipboard=unnamedplus             " used plus
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
" set scrolljump=50
set redrawtime=1500
set synmaxcol=200                     " Stop decorate after this column number
set lazyredraw                        " Why it makes slower in some cases?

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

set relativenumber                    " Use relative line numbers
set matchpairs+=<:>                   " Highlight matching pairs of brackets. Use the '%' character to jump.
set sessionoptions=buffers,curdir,folds,help,slash,tabpages,winsize " Force session options, avoid saving explorer

set noswapfile 
set noundofile

" if line('$') > 50
"   set scrolljump = 50
" endif


let g:onedark_style = 'darker'

let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0
let g:loaded_python_provider=0

" Somehow we need to bring this out because it could be computer specified
let g:python3_host_prog='/usr/bin/python3'

let g:webdevicons_enable = 1

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

let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<c-m>'
let g:user_emmet_install_global=1
imap <expr> <c-e> emmet#expandAbbrIntelligent("\<c-m>")
let g:user_emmet_expandabbr_key='<c-m>'

" Allow JSX in normal JS files
let g:jsx_ext_required=0

let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger='<Nop>' " Use tab here will cause the conflict with coc.nvim
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

let g:startify_change_to_dir = 0                " Do not change CWD when open files from MRU list
let g:startify_fortune_use_unicode = 1
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
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
\ { 'type': 'sessions',  'header': ['   Sessions']                                },
\ { 'type': 'files',     'header': ['   Recent opened files: ']                   },
\ { 'type': 'dir',       'header': ['   Current working directory: '. getcwd()]   },
\ ]

let g:git_messenger_always_into_popup=v:true    " the cursor goes into a popup window
let g:git_messenger_max_popup_height=60
let g:git_messenger_max_popup_width=110

" Coc settings
let g:coc_config_home = '~/dotfiles'
" let g:coc_global_extensions = [
"   \'coc-actions',
"   \'coc-emmet',
"   \'coc-eslint',
"   \]

" Indent options
highlight IndentBlanklineChar guifg=#323232 gui=nocombine
let g:indent_blankline_char = '│'
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_context_patterns = [
  \'class', 'function', 'method',
  \'^if', '^while', '^for', '^object', '^table',
  \'block', 'arguments', 'statement', 'switch_body',
  \'declaration', 'expression', 'pattern', 'primary_expression',
  \'jsx_fragment', 'jsx_element', 'jsx_self_closing_element',
  \'jsx_attribute', 'jsx_closing_element', 'jsx_opening_element',
  \]

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

" fugitive mappings
nmap <silent> <space>gd :Gdiffsplit<CR>
nmap <silent> <space>gb :Gblame<CR>

" git-messenger mappings
nmap <silent> gm <Plug>(git-messenger) 

" Remap for split-join
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Smart F (press <esc> to cancel.)
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
" nmap ; <Plug>(coc-smartf-repeat)
" nmap , <Plug>(coc-smartf-repeat-opposite)

" nnoremap <nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" ############# Snippets #############
" " Use <C-l> for trigger snippet expand.
" imap <c-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <c-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" press <esc> to cancel.
" nmap f <Plug>(coc-smartf-forward)
" nmap F <Plug>(coc-smartf-backward)
" nmap ; <Plug>(coc-smartf-repeat)
" nmap , <Plug>(coc-smartf-repeat-opposite)

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<Tab>" :
"      \ coc#refresh()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Add surround map
nmap <silent> as ysiw

map <c-b> :enew<cr>

" Switching tab with left/right
nnoremap <silent> <Right> :bnext<cr>
nnoremap <silent> <Left>  :bprevious<cr>

" Open/close and jump to next/previous "error"
" I use this as a hack for working with TODO list
nnoremap <silent> <Up> :cprev<cr>
nnoremap <silent> <Down> :cnext<cr>
nnoremap <silent> <PageUp> :copen<cr>
nnoremap <silent> <PageDown> :cclose<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Format Go code
nnoremap <silent> <leader>f :GoFmt<cr>

" Open Startify with F11
nnoremap <silent> <F11> :Startify<CR>

noremap <leader>ss :call StripWhitespace()<CR>

" Strip trailing whitespace (<leader>ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

function! CleanUp()
  noh
endfunction
" turn off highlight
nnoremap <silent> <space>n :noh<CR>
nnoremap <silent> <Esc><Esc> :call CleanUp()<CR>
" Remap for rename current word

nnoremap <silent> <F5> :source $MYVIMRC<cr>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-u>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

command! W w
command! Q q
command! Wa wa
command! Wqa wqa
command! WQa wqa
command! Qa qa

command! Bclose call <SID>BufcloseCloseIt()
nnoremap <silent> <space>q :Bclose<cr>

nnoremap <silent> cl "ayiwoconsole.log('### <C-R>a: ', <C-R>a);<Esc>
nnoremap <silent> cL "ayiwOconsole.log('### <C-R>a: ', <C-R>a);<Esc>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " autocmd BufEnter,InsertLeave,CursorHold * :syntax sync fromstart
    augroup UsefulJobs
      " autocmd VimEnter * call UpdateVimPlug()
      autocmd User CocGitStatusChange {command}
      autocmd BufEnter let b:coc_suggest_disable = 1
      " autocmd ColorScheme * highlight highlight NvimTreeBg guibg=#004200
      " autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg
    augroup end

    " augroup ShowTypeOnHover
    "   autocmd FileType *.ts,*.tsx,*.js,*.jsx
    "       \ autocmd! ShowTypeOnHover CursorHold * silent call CocActionAsync('doHover')
    " augroup END

    augroup MapFileType
      autocmd!
      autocmd BufRead,BufNewFile *.ino,*.pde set filetype=c++
      autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript  " Treat .json files as .js
      autocmd BufNewFile,BufRead *.md setlocal filetype=markdown            " Treat .md files as Markdown
      autocmd BufEnter NvimTree :NvimTreeRefresh
    augroup end

    augroup QuicFixCustom
      autocmd!
      autocmd FileType qf call <SID>MoveQuickFix()
      autocmd FileType qf map <buffer> <Del> :RemoveQFItem<cr>
    augroup end

    augroup filetype_python
      autocmd FileType python setlocal shiftwidth=4 tabstop=4
      autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3 %'<CR>
      " nnoremap <F9> :!love .<CR> -- lua love framework
    augroup end

    " augroup Smartf
    "   autocmd!
    "   autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#00ff33
    "   autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
    " augroup end 

    augroup UpdateBuffer
      autocmd!
      autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
      " Trigegr `autoread` when files changes on disk
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
      " Notification after file change
      " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    augroup end

    augroup GitMessenger
      autocmd!
      autocmd FileType gitmessengerpopup call <SID>setup_gitmessengerpopup()
    augroup end
endif

highlight DiffAdd     gui=NONE guibg=NONE guifg=#98c379
highlight DiffChange  gui=NONE guibg=NONE guifg=#56b6c2
highlight DiffDelete  gui=NONE guibg=NONE guifg=#be5046

" Run PlugUpdate every week automatically when entering Vim.
" function! UpdateVimPlug() abort
"   if exists('g:plug_home')
"     let l:filename = printf('%s/.vim_plug_update', g:plug_home)
"     if filereadable(l:filename) == 0
"       call writefile([], l:filename)
"     endif

"     let l:this_week = strftime('%Y_%V')
"     let l:contents = readfile(l:filename)
"     if index(l:contents, l:this_week) < 0
"       call execute('PlugUpdate')
"       call writefile([l:this_week], l:filename, 'a')
"     endif
"   endif
" endfunction

function! s:setup_gitmessengerpopup() abort
    nmap <buffer><C-h> o
    nmap <buffer><C-l> O
endfunction

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

" Fix problem with utilsnip imp module problem
" patch 8.1.0201 will fix this
if has('python3')
  silent! python3 1
endif
