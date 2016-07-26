set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/.vim/bundle/Vundle.vim
call vundle#begin('~/dotfiles/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/deoplete.nvim'
Plugin 'itchyny/lightline.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'honza/vim-snippets'
Plugin 'zchee/deoplete-go'
Plugin 'Konfekt/FastFold'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-expand-region'

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

syntax on

" set design of vertical split divider
set fillchars+=vert:│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE

" Solarized Colours
syntax enable
set background=dark
colorscheme solarized

if !has('gui_running')
  set t_Co=256
endif

" leader key
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"split navigations
nnoremap <C-J> <C-W><C-J> " Ctrl-j move to the split below
nnoremap <C-K> <C-W><C-K> " Ctrl-k move to the split above
nnoremap <C-L> <C-W><C-L> " Ctrl-l move to the split right
nnoremap <C-H> <C-W><C-H> " Ctrl-h move to the split left

" copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>W :wq<cr>
nmap <leader>q :qa<cr>
nmap <leader>Q :q!<cr>
" Enter visual line mode
nmap <Leader><Leader> V
" Close quickfix easily
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>lc :lclose<CR>
" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" tagbar
nmap <leader>tg :TagbarToggle<CR>
" open vsplit window
nmap <leader>vs :50vsp<CR>
" open terminal
noremap <leader>tt :terminal<CR>
" enter normal mode in terminal
tnoremap <C-n> <C-\><C-n>
" save no history or bookmarks in netrw
:let g:netrw_dirhistmax = 0

" toggle cursorline & cursorcolumn
:nnoremap <Leader>cc :set cursorline! cursorcolumn!<CR>

" relative line numbers off in insert mode
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set nonumber relativenumber

" highlight column only in INSERT mode
autocmd InsertEnter * setlocal colorcolumn=80,120
autocmd InsertLeave * setlocal colorcolumn=0

" improved search & replace
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

set ruler                  " show the cursor position all the time
set showcmd              " show me what I'm typing
set nolazyredraw           " turn off lazy redraw
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set number                 " line numbers
set relativenumber         " relative line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
au FocusLost * :wa              " Set vim to save the file on focus out.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airlien or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching
set hlsearch               " don't highlight searches
set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set wrap                   " wrap lines
set showbreak=↪
set textwidth=80           " lines are automatically wrapped after 80 columns
set nofoldenable           " turn off folding
set autochdir " automatically change window's cwd to file's dir
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set smarttab
set formatoptions+=n       " support for numbered/bullet lists
set virtualedit=block      " allow virtual edit in visual block ..
set linebreak
set tw=500
set noerrorbells           " don't bell or blink
set hidden                  " hide buffers, don't close
set autowrite               " Automatically save before :next, :make etc.
set hlsearch                " highlight search terms
set incsearch               " show search matches as you type
set pastetoggle=<F2>        " toggle paste mode
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
" set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" specify syntax highlighting for specific files
au Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Python settings
au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab autoindent fileformat=unix
let g:python3_host_prog = '/usr/bin/python3'
let python_highlight_all=1

" js/html/css settings
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" Rainbow parenthesis always on!
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Change colourscheme when diffing
fun! SetDiffColors()
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
    highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
    highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" ========= vim-expand-region ================
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ==================== NerdTree ====================
noremap <Leader>nn :NERDTreeToggle<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" open automatically if no files specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_term_width = 30
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

au FileType go nmap <Leader>s  <Plug>(go-def-split)
au FileType go nmap <Leader>v  <Plug>(go-def-vertical)
au FileType go nmap <Leader>i  <Plug>(go-info)
au FileType go nmap <Leader>l  <Plug>(go-metalinter)
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>dt <Plug>(go-test-compile)
au FileType go nmap <Leader>d  <Plug>(go-doc)

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" ==================== Lightline ====================
"
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'filename' ],
      \             [ 'fugitive', 'modified', 'ctrlpmark']],
      \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding' ], [ 'syntastic' ]]
      \ },
      \ 'inactive': {
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
    return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.go,*.py call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" ==================== Syntastic =====================
let g:syntastic_go_checkers = ['golint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nmap <leader>ee :Errors<cr>
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5

" ==================== Neosnippets ====================
" Plugin key-mappings.
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB>
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" ==================== CtrlP ====================
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>bb :CtrlPBuffer<CR>
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10   " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_line_prefix = '→'

let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" ==================== Completion =========================
" use deoplete for Neovim.
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#go#gocode_binary="$GOPATH.'/bin/gocode'"
  let g:deoplete#sources#go#pointer=1
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = []
  let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
  let g:deoplete#sources#go#align_class = 1

  " Use partial fuzzy matches like YouCompleteMe
  call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
  call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
endif

" ==================== Python-Mode =========================
let g:pymode = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_folding = 1
" [[                Jump to previous class or function (normal, visual, operator modes)
" ]]                Jump to next class or function  (normal, visual, operator modes)
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'D'
let g:pymode_virtualenv = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>rr'
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_message = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_lint_ignore = "E501,F0002"
let g:pymode_lint_cwindow = 1
let g:pymode_rope = 0
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all

" ==================== Jedi ====================
" let g:jedi#use_splits_not_buffers = "right"
let g:jedi#force_py_version = 3

" ==================== Fugitive ====================
nnoremap <leader>ga :Git add --all<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gpm :Gpush origin master<CR>
nnoremap <leader>gpd :Gpush origin develop<CR>
nnoremap <leader>gc :Gcommit<CR>

" ========= vim-better-whitespace ==================
" auto strip whitespace except for file with extention blacklisted
let blacklist = ['markdown', 'md']
autocmd BufWritePre * StripWhitespace
highlight ExtraWhitespace ctermbg=DarkGreen

" ========= minibufexpl ==================
map <leader>bt :MBEToggle<cr>
map <leader>tr :MBEToggleMRU<cr>
map <Tab> :MBEbf<CR>
map <leader><Tab> :MBEbp<CR>
" Buffer closing
nnoremap <leader>bq :bd!<CR>
nnoremap <leader>bd :bd<CR>
" Buffer menu
nnoremap <leader>bs :vert sb<Space>

let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplStatusLineText = "buffers"
" let g:miniBufExplShowBufNumbers = 0
let g:miniBufExplCycleArround = 1
" let g:did_minibufexplorer_syntax_inits = 1
let g:miniBufExplUseSingleClick = 1

" hi MBENormal               guifg=red guibg=white
" hi MBEChanged              guifg=white guibg=fg
" hi MBEVisibleNormal        guifg=white guibg=fg
" hi MBEVisibleChanged       guifg=red guibg=fg
" hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
" hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" ========= Startify =====================
" start vim with startify & nerdtree
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:startify_custom_header = [
    \ '    GREETINGS PROFESSOR FALKEN.',
    \ '',
    \ '    SHALL WE PLAY A GAME?',
    \ ]

" ========= vim-markdown =============
let g:vim_markdown_frontmatter = 1

