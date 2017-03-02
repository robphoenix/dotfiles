" --> vim-plug {

call plug#begin()

Plug 'chriskempson/base16-vim'          " Base16 colourscheme
Plug 'vim-scripts/cisco.vim'            " Cisco config highlighting
Plug 'robertmeta/nofrils'               " minimal syntax highlighting
Plug 'kien/rainbow_parentheses.vim'     " Fancy matching parens+
Plug 'tpope/vim-surround'               " Add quotes/parenthesis etc.
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'airblade/vim-gitgutter'           " Gutter markers for Git
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git gutter markers in NERDTree
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy Finder
Plug 'ntpeters/vim-better-whitespace'   " Remove whitespace
Plug 'Raimondi/delimitMate'             " Auto-insert closing delimiters
Plug 'vim-airline/vim-airline'          " Sweet statusline
Plug 'vim-airline/vim-airline-themes'   " Sweet statusline themes
Plug 'scrooloose/nerdtree'              " File explorer
Plug 'klen/python-mode'                 " Python
Plug 'zchee/deoplete-jedi'              " Python autocomplete
Plug 'jmcantrell/vim-virtualenv'        " Python Virtualenvs
Plug 'scrooloose/syntastic'             " Syntax checker
Plug 'SirVer/ultisnips'                 " Code snippets
Plug 'honza/vim-snippets'               " Code snippets
Plug 'godlygeek/tabular'                " Line up tabular data
Plug 'plasticboy/vim-markdown'          " Markdown
Plug 'vim-scripts/taglist.vim'          " Source Code Browser
Plug 'mhinz/vim-startify'               " Fancy start screen
Plug 'terryma/vim-expand-region'        " Visually select increasingly larger regions of text using the same key combination
Plug 'ervandew/supertab'                " Use tab to for completions
Plug 'tpope/vim-commentary'             " Commenting
Plug 'Yggdroot/indentLine'              " Visualize indentation levels
Plug 'mhinz/vim-sayonara'               " Easy buffer closing
Plug 'terryma/vim-multiple-cursors'     " Like Sublime Text
Plug 'Konfekt/FastFold'                 " Fold updating
Plug 'fatih/vim-go'                     " Golang
Plug 'pearofducks/ansible-vim'          " Ansible
Plug 'Chiel92/vim-autoformat'           " Code formatting
Plug 'Rykka/riv.vim'                    " reStructured Text

if has('nvim')
    Plug 'Shougo/deoplete.nvim'         " NeoVim autocomplete
    Plug 'zchee/deoplete-go'            " Go autocomplete
    Plug 'crosbymichael/vim-cfmt'       " Auto-format C code
else
    Plug 'Shougo/neocomplete.vim'       " Vim autocomplete
endif

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

" Colourscheme
syntax enable
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

set ruler                       " show the cursor position all the time
set showcmd                     " show partial commands in status line and selected characters/lines in visual mode
set nolazyredraw                " turn off lazy redraw
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autoread                    " Automatically reread changed files without asking me anything
set norelativenumber            " no relative line numbers
set number                      " line numbers
set wildmenu                    " show list instead of just completing
set wildmode=full               " zsh-like autcomplete menu for Ex commands
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
set history=1000                " Store a ton of commands/search history (default is 20)
set nospell                     " spell checking off by default
set spelllang=en_gb             " jolly good spelling chap
set noundofile                  " no annoying .un~ files
set modelines=1
set cursorline                  " let's highlight the line the cursor is on
set colorcolumn=79,119          " highlight columns
set grepprg=pt                  " Use PT for grepping
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

if has('nvim')
    set inccommand=split            " incremental command live feedback
endif

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" save no history or bookmarks in netrw
:let g:netrw_dirhistmax = 0

" Vim interprets .md as 'modula2' otherwise, see :set filetype?
au Bufread,BufNewFile *.md setlocal filetype=markdown tw=80 wrap

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
autocmd BufEnter *.go colorscheme nofrils-dark
autocmd BufLeave *.go colorscheme base16-default-dark

" Python settings
au BufNewFile,BufRead *.py setlocal et ts=4 sts=4 sw=4 tw=79 list lcs=tab:▸\
let g:python3_host_prog = '/usr/bin/python3'
let python_highlight_all=1

" Yaml settings
au BufNewFile,BufRead *.yaml setlocal ts=2 sw=2 sts=2
au BufNewFile,BufRead *.yml setlocal ts=2 sw=2 sts=2

" lua settings
au BufNewFile,BufRead *.lua setlocal ts=2 sw=2 sts=2

" js settings
au BufNewFile,BufRead *.js setlocal ts=2 sw=2 sts=2

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

" split navigations
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Buffer switching
nnoremap L :bn<CR>
nnoremap H :bp<CR>
" Buffer closing
nnoremap <silent> <leader>q :Sayonara<CR>
nnoremap <leader>bq :bd!<CR>

" open buffer in vertical split
nnoremap <leader>sb :vert sb<Space>

" Remap - to move to end of line (0 to move to beginning)
nnoremap - $
vnoremap - $
onoremap - $

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

" Visual linewise up and down by default
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" substitution (replace) word under cursor
nnoremap <C-s> :%s/<C-r><C-w>//c<left><left>

" See errors
nmap <leader>ee :Errors<cr>

" deal with quickfix easily
nnoremap <leader>a :cclose<CR>

" close location list
nnoremap <leader>l :lclose<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" build current C program, output has same name
autocmd FileType c nnoremap <silent> <leader>mc :!clear;gcc % -o %:r.out<CR>

" resizing splits
nnoremap <silent> <a-h> :vertical resize +10<cr>
nnoremap <silent> <a-l> :vertical resize -10<cr>
nnoremap <silent> <a-j> :res +10<cr>
nnoremap <silent> <a-k> :res -10<cr>

" navigating commands history
cnoremap <c-k> <Up>
cnoremap <c-j> <Down>

" read output of shell commands to file
nnoremap <leader>r :read !

" Startify any time
nnoremap <leader>ss :Startify<CR>

" vim-plug
nnoremap <silent> <a-p> :PlugUpgrade<CR> :PlugUpdate<CR>

" }

" --> Plugins {

" --> vim-autoformat {

let g:formatter_yapf_style = 'google'
au BufWrite *.py,*.js,*.lua :Autoformat

" }

" --> taglist {

nmap <leader>t :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

" }

" --> no-frils {

let g:nofrils_strbackgrounds=1
nmap <leader>cf :NofrilsFocusCode<CR>
nmap <leader>fc :NofrilsFocusComments<CR>

"  }

" --> vim-virtualenv {

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(venv: %n)'

"  }

" --> vim-airline {

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.paste = 'ρ'

let g:airline#extensions#syntastic#enabled = 1

let g:airline_section_z = '%l/%L:%c'
"let g:airline_section_y = ''

"  }

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

" --> vim-cfmt {
let g:cfmt_style = '-linux'
autocmd BufWritePre *.c,*.h Cfmt
"  }

" --> SuperTab {

let g:SuperTabDefaultCompletionType = "<TAB>"
" we need to remap this to not interfere with delimitMate
let g:SuperTabMappingBackward = '<c-k>'

" }

" --> vim-expand-region {
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }

" --> NerdTree {
noremap <Leader>n :NERDTreeToggle<cr>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.cache$', '__pycache__', '\.pyc$', '\.vagrant$', '\~$', '\.git$', '.DS_Store']
let NERDTreeQuitOnOpen=1
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 50

" close vim if the only window left open is NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }

" --> vim-go {

" let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
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
let g:go_highlight_extra_types = 1
let g:go_term_width = 30
let g:go_term_enabled = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "ultisnips"
set updatetime=100

autocmd FileType go nmap <Leader>gl  <Plug>(go-metalinter)
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
au FileType go nmap <Leader>gr <Plug>(go-run-split)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gd :GoDecls<CR>
autocmd FileType go nmap <leader>cd :GoDeclsDir<CR>
autocmd FileType go nmap <leader>rn :GoRename<space>

" }

" --> delimitMate {

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" }

" --> Syntastic {

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5

"" language checkers
" let vim-go handle syntax checking
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "passive_filetypes": ["go"] }
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_c_checkers = ['splint', 'make', 'gcc']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_ansible_checkers = ['ansible_lint', 'yamllint']
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"
let g:syntastic_markdown_checkers = ["markdownlint"]

" }

" --> UltiSnips {

" if has('nvim')
"     let g:UltiSnipsUsePythonVersion = 3
" else
"     let g:UltiSnipsUsePythonVersion = 2
" endif
" let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsUsePythonVersion = 2
let g:ultisnips_python_style = "google"
let g:UltiSnipsExpandTrigger = "<c-l>"

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

" --> Autocompletion {

if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#go#gocode_binary="$GOPATH.'/bin/gocode'"
    let g:deoplete#sources#go#pointer = 1
    let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
    let g:deoplete#sources#go#align_class = 1
    let deoplete#sources#jedi#show_docstring = 1

    " Use partial fuzzy matches like YouCompleteMe
    call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
    call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
    call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
else
    let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
    let g:neocomplete#enable_at_startup = 1 " Use neocomplete
    let g:neocomplete#enable_auto_delimiter = 1 " insert delimiter automatically
    autocmd Filetype python setlocal omnifunc=pythoncomplete#Complete
endif

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
let g:pymode_run_bind = '<leader>r'
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

" --> jedi-vim {

let g:jedi#force_py_version = 3
"let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>ju"

" }

" --> Fugitive {

nnoremap <leader>ga :Git add --all<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gbrowse<CR>
nnoremap <leader>gpm :Gpush origin master<CR>
nnoremap <leader>gpd :Gpush origin develop<CR>

" }

" --> vim-better-whitespace {

" auto strip whitespace except for file with extension blacklisted
let blacklist = ['markdown', 'md']
autocmd BufWritePre * StripWhitespace
highlight ExtraWhitespace ctermbg=DarkGreen

" }

" --> Startify {

let g:startify_list_order = [
            \ ['   Current directory:'],
            \ 'dir',
            \ ['   Most recently used'],
            \ 'files',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ]
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, {'d': '~/dotfiles/'} ]
let g:startify_files_number = 5
let g:startify_change_to_dir = 1
let g:startify_enable_special = 0
let g:startify_change_to_dir = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
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
" open NERDTree as well
" autocmd VimEnter *
"                 \   if !argc()
"                 \ |   Startify
"                 \ |   NERDTree
"                 \ |   wincmd w
"                 \ | endif

" }

" --> vim-markdown {

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0

" }

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
