" --> vim-plug {

call plug#begin()

Plug 'altercation/vim-colors-solarized' " Solarized Colour Scheme
Plug 'tpope/vim-surround'               " Add quotes/parenthesis etc.
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'airblade/vim-gitgutter'           " Gutter markers for Git
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git gutter markers in NERDTree
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy Finder
Plug 'ntpeters/vim-better-whitespace'   " Remove whitespace
Plug 'Raimondi/delimitMate'             " Auto-insert closing delimiters
Plug 'itchyny/lightline.vim'            " Sweet statusline
Plug 'scrooloose/nerdtree'              " File explorer
Plug 'klen/python-mode'                 " Python
Plug 'davidhalter/jedi-vim'             " Extra Python
Plug 'zchee/deoplete-jedi'              " Python autocomplete
Plug 'alfredodeza/pytest.vim'           " Python testing
Plug 'jmcantrell/vim-virtualenv'        " Python Virtualenvs
Plug 'scrooloose/syntastic'             " Syntax checker
Plug 'SirVer/ultisnips'                 " Code snippets
Plug 'honza/vim-snippets'               " Code snippets
Plug 'godlygeek/tabular'                " Line up tabular data
Plug 'plasticboy/vim-markdown'          " Markdown
Plug 'majutsushi/tagbar'                " Overview of Structure
Plug 'mhinz/vim-startify'               " Fancy start screen
Plug 'terryma/vim-expand-region'        " Visually select increasingly larger regions of text using the same key combination
Plug 'ervandew/supertab'                " Use tab to for completions
Plug 'ap/vim-buftabline'                " Buffer info in tabs
Plug 'scrooloose/nerdcommenter'         " Comments
Plug 'Yggdroot/indentLine'              " Visualize indentation levels
Plug 'mhinz/vim-sayonara'               " Easy buffer closing
Plug 'terryma/vim-multiple-cursors'     " Like Sublime Text
Plug 'Konfekt/FastFold'                 " Fold updating
Plug 'fatih/vim-go'                     " Golang
Plug 'pearofducks/ansible-vim'          " Ansible
Plug 'Shougo/deoplete.nvim'             " NeoVim autocomplete
Plug 'zchee/deoplete-go'                " Go autocomplete
Plug 'crosbymichael/vim-cfmt'           " Auto-format C code
Plug 'vim-scripts/cisco.vim'            " Cisco config highlighting
Plug 'chriskempson/base16-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'daviesjamie/vim-base16-lightline'

call plug#end()

" }

" --> Settings {

set nocompatible    " be iMproved, required
set t_Co=256        " ensure vim uses 256 colours, just in case TERM is not xterm-256color

" set design of vertical split divider
set fillchars=fold:\ ,vert:\ ,
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE
" set design of fold
autocmd ColorScheme * highlight Folded cterm=BOLD ctermfg=NONE ctermbg=NONE
" set design of BufTabLine
autocmd ColorScheme * highlight BufTabLineFill cterm=BOLD
autocmd ColorScheme * highlight BufTabLineCurrent cterm=NONE ctermfg=015 ctermbg=000
autocmd ColorScheme * highlight BufTabLineActive cterm=NONE ctermfg=248 ctermbg=000
autocmd ColorScheme * highlight BufTabLineHidden cterm=NONE ctermfg=011 ctermbg=000

" Solarized Colours
syntax enable
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
"colorscheme solarized
" toggle background light/dark
call togglebg#map("<F5>")

set ruler                       " show the cursor position all the time
set showcmd                     " show partial commands in status line and selected characters/lines in visual mode
set nolazyredraw                " turn off lazy redraw
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autoread                    " Automatically reread changed files without asking me anything
set relativenumber              " relative line numbers - combined with `set number` gives hybrid mode
set number                      " line numbers - combined with `set relativenumber` gives hybrid mode
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " list matches, then longest common part, then all
au FocusLost * :wa              " Set vim to save the file on focus out.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ch=2                        " command line height
set backspace=2                 " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]      " backspace and cursor keys wrap to
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set report=0                    " tell us about changes
set nostartofline               " don't jump to the start of line when scrolling
set incsearch                   " show search matches as you type
set laststatus=2                " always show the status line
set ignorecase                  " ignore case when searching
set hlsearch                    " highlight searches
set autoindent                  " automatic indent new lines
set smartindent                 " be smart about it
set nowrap                      " dont't wrap lines
set showbreak=↪
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set nofoldenable                " don't auto fold code
set foldnestmax=10              " 10 nested fold max
set foldmethod=indent           " fold based on indent
set gdefault                    " the /g flag on :s substitutions by default
set autochdir                   " automatically change window's cwd to file's dir
set shiftwidth=4                " use indents of 4 spaces
set tabstop=4                   " an indentation every four columns
set expandtab                   " tabs are spaces, not tabs
set softtabstop=4               " let backspace delete indent
set pastetoggle=<F2>            " pastetoggle (sane indentation on pastes)
set smarttab
set formatoptions+=n            " support for numbered/bullet lists
set virtualedit=block           " allow virtual edit in visual block ..
set linebreak
set noerrorbells                " don't bell or blink
set hidden                      " hide buffers, don't close
set autowrite                   " Automatically save before :next, :make etc.
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set spell                       " spell checking on
set spelllang=en_gb
set noundofile                  " no annoying .un~ files
set modelines=1

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" save no history or bookmarks in netrw
:let g:netrw_dirhistmax = 0

" highlight column only in INSERT mode
autocmd InsertEnter * setlocal colorcolumn=79,119
autocmd InsertLeave * setlocal colorcolumn=0

" relative line numbers off in insert mode
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber number

" highlight cursorline only in INSERT mode
:autocmd InsertEnter,InsertLeave * set cul!

" Vim interprets .md as 'modula2' otherwise, see :set filetype?
au Bufread,BufNewFile *.md setlocal filetype=markdown textwidth=80 wrap

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Python settings
au BufNewFile,BufRead *.py setlocal ts=4 sts=4 sw=4 tw=79 list lcs=tab:▸\
let g:python3_host_prog = '/usr/bin/python3'
let python_highlight_all=1

" Yaml settings
au BufNewFile,BufRead *.yaml setlocal ts=2 sw=2 sts=2
au BufNewFile,BufRead *.yml setlocal ts=2 sw=2 sts=2

" Cisco config files
au BufRead,BufNewFile *.cfg set filetype=cisco
au BufRead,BufNewFile *.conf set filetype=cisco

" }

" --> Key (re)Mappings {

" leader key
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" remap ESC
inoremap jk <ESC>

" easily edit .vimrc in new buffer
nmap <leader>v :edit $MYVIMRC<CR>

" enter visual line mode
nmap <leader><leader> V

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer switching
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" Buffer closing
nnoremap <silent> <leader>q :Sayonara<CR>
nnoremap <leader>bq :bd!<CR>

" open buffer in vertical split
nnoremap <leader>bs :vert sb<Space>

" list buffers
nnoremap <leader>bl :ls<CR>

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" spell checking
nnoremap <F6> :setlocal spell! spell?<CR>

" copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Fast saving
nmap <leader>w :w!<cr>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" When jump to next match also centre screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" deal with quickfix easily
map <leader>cn :cnext<CR>
map <leader>cp :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" close location list
map <leader>ln :lnext<CR>
map <leader>lp :lprevious<CR>
nnoremap <leader>lc :lclose<CR>
nnoremap <leader>lo :lopen<CR>

" tagbar
nmap <leader>tt :TagbarToggle<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" find files
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>fm :CtrlPMRU<CR>

" make current C program, output has same name
autocmd FileType c nnoremap <silent> <leader>mc :!clear;gcc % -o %:r.out<CR>

" travis-ci
nnoremap <leader>th :!travis history --limit 3<CR>

" }

" --> Plugins {

" --> Rainbow Parentheses {
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

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"  }

" --> ansible-vim {
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
"  }

" --> pytest.vim {
nmap <silent><Leader>tp :Pytest project<CR>
nmap <silent><Leader>ts :Pytest session<CR>
nmap <silent><Leader>te :Pytest error<CR>
"  }

" --> vim-cfmt {
let g:cfmt_style = '-linux'
autocmd BufWritePre *.c,*.h Cfmt
"  }

" --> SuperTab {

let g:SuperTabDefaultCompletionType = "<c-n>"
" we need to remap this to not interfere with delimitMate
let g:SuperTabMappingBackward = '<c-k>'

" }

" --> vim-buftabline {
let g:buftabline_show = 2
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
"  }

" --> vim-expand-region {
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }

" --> NerdTree {
noremap <Leader>nn :NERDTreeToggle<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.cache$', '__pycache__', '\.pyc$', '\.vagrant$', '\~$', '\.git$', '.DS_Store']
let NERDTreeQuitOnOpen=1

" Windows garbled NERDTree's arrows
if !has('nvim')
    let g:NERDTreeDirArrowExpandable = '►'
    let g:NERDTreeDirArrowCollapsible = '▼'
endif

" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }

" --> vim-go {

if has('nvim')
    " let g:go_fmt_fail_silently = 1
    let g:go_list_type = "quickfix"
    let g:go_fmt_command = "goimports"
    let g:go_metalinter_autosave = 0
    let g:go_autodetect_gopath = 1
    let g:go_term_enabled = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_space_tab_error = 1
    let g:go_highlight_array_whitespace_error = 1
    let g:go_highlight_trailing_whitespace_error = 1
    let g:go_highlight_extra_types = 0
    let g:go_term_width = 30
    let g:go_term_enabled = 1
    let g:go_auto_sameids = 1
    let g:go_auto_type_info = 1
    set updatetime=100

    autocmd FileType go nmap <Leader>l  <Plug>(go-metalinter)
    autocmd FileType go nmap <leader>b  <Plug>(go-build)
    autocmd FileType go nmap <leader>rr  <Plug>(go-run)
    autocmd FileType go nmap <leader>t  <Plug>(go-test)
    autocmd FileType go nmap <leader>d :GoDecls<CR>
    autocmd FileType go nmap <leader>cd :GoDeclsDir<CR>
    autocmd FileType go nmap <leader>rn :GoRename<space>
    autocmd FileType go nmap <leader>gp :GoPlay<space>
endif

" }

" --> delimitMate {

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" }

" --> Syntastic {

let g:syntastic_go_checkers = ['golint']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_c_checkers = ['splint', 'make', 'gcc']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_ansible_checkers = ['ansible_lint', 'yamllint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let python-mode handle syntax checking
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "passive_filetypes": ["python"] }

nmap <leader>ee :Errors<cr>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5

" }

" --> UltiSnips {

let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style = "google"
let g:UltiSnipsExpandTrigger="<c-j>"

" }

" --> CtrlP {

let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10         " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_mruf_max=450            " number of recently opened files
let g:ctrlp_max_files=0             " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_line_prefix = '>'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" }

" --> Deoplete {

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary="$GOPATH.'/bin/gocode'"
let g:deoplete#sources#go#pointer=1
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
let deoplete#sources#jedi#show_docstring = 1

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

" }

" --> Python-Mode {

let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_virtualenv = 0
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>pr'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['flake8']
let g:pymode_lint_ignore = "E501,F0002,E115,E116"
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_rope = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all

" }

" --> Jedi {

let g:jedi#force_py_version = 3
let g:jedi#popup_on_dot = 0

" }

" --> Fugitive {

nnoremap <leader>ga :Git add --all<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gbrowse<CR>
nnoremap <leader>gpm :Gpush origin master<CR>
nnoremap <leader>gpd :Gpush origin develop<CR>
nnoremap <leader>gpp :Gpush<Space>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gdsf :Git dsf<CR>
nnoremap <leader>gl :Git l<CR>

" }

" --> vim-better-whitespace {

" auto strip whitespace except for file with extension blacklisted
let blacklist = ['markdown', 'md']
autocmd BufWritePre * StripWhitespace
highlight ExtraWhitespace ctermbg=DarkGreen

" }

" --> Startify {

let g:startify_custom_header = [
    \ '',
    \ '    , __            _                          _   _',
    \ '   /|/  \       o  | |    |      ()           | | | |',
    \ '    | __/          | |  __|      /\_|_        | | | |',
    \ '    |   \|   |  |  |/  /  |     /  \|  |   |  |/  |/',
    \ '    |(__/ \_/|_/|_/|__/\_/|_/  /(__/|_/ \_/|_/|__/|__/',
    \ '                                              |\  |\',
    \ '                                              |/  |/',
    \ ]

" }

" --> vim-markdown {

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0

" }

" --> Lightline {
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'ctrlpmark' ],
      \            [ 'fugitive', 'virtualenv', 'filename' ]],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'syntastic' ]]
      \ },
      \ 'inactive': {
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'percent': 'LightLinePercent',
      \   'mode': 'LightLineMode',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'LightLineFiletype',
      \   'modified': 'LightLineModified',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \   'virtualenv': 'LightLineVirtualenv',
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

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
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

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineVirtualenv()
  "return exists('*virtualenv#statusline') ? virtualenv#statusline() : ''
  return virtualenv#statusline()
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_item], 0)
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
  autocmd BufWritePost *.sh,*.yaml,*.yml,*.c,*.go,*.py call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" }


" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
