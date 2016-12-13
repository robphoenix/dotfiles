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
Plug 'vim-airline/vim-airline'          " Sweet statusline
Plug 'vim-airline/vim-airline-themes'   " Sweet statusline themes
Plug 'scrooloose/nerdtree'              " File explorer
Plug 'klen/python-mode'                 " Python
Plug 'davidhalter/jedi-vim'             " Extra Python
Plug 'zchee/deoplete-jedi'              " Python autocomplete
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
Plug 'chriskempson/base16-vim'          " Base16 colourscheme
Plug 'kien/rainbow_parentheses.vim'     " Fancy matching parens+
Plug 'robertmeta/nofrils'               " minimal syntax highlighting

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
set relativenumber              " relative line numbers - combined with `set number` gives hybrid mode
set number                      " line numbers - combined with `set relativenumber` gives hybrid mode
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
set inccommand=split            " incremental command live feedback
set grepprg=pt

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
":autocmd InsertEnter,InsertLeave * set cul!

" Vim interprets .md as 'modula2' otherwise, see :set filetype?
au Bufread,BufNewFile *.md setlocal filetype=markdown textwidth=80 wrap

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd BufEnter *.go colorscheme nofrils-dark
autocmd BufLeave *.go colorscheme base16-default-dark

" Python settings
au BufNewFile,BufRead *.py setlocal et ts=4 sts=4 sw=4 tw=79 list lcs=tab:▸\
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
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Buffer switching
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
" Buffer closing
nnoremap <silent> <leader>q :Sayonara<CR>
nnoremap <leader>bq :bd!<CR>

" open buffer in vertical split
nnoremap <leader>sb :vert sb<Space>

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

" Visual linewise up and down by default
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" substitution (replace) word under cursor
nnoremap <C-s> :%s/<C-r><C-w>//gc<left><left><left>

" grep with pt
" st: Search This (file) for word under cursor
nnoremap <leader>st :grep! <C-r><C-w> %<CR>:cw<CR>
" sa: Search All (files) for word under cursor
nnoremap <leader>sa :grep! <C-r><C-w> <CR>:cw<CR>
command -nargs=+ -complete=file -bar Pt silent! grep! <args>|cwindow|redraw!
nnoremap \ :Pt<space>

" deal with quickfix easily
nnoremap <leader>a :cclose<CR>

" close location list
nnoremap <leader>l :lclose<CR>

" tagbar
nmap <leader>t :TagbarToggle<CR>

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

" integrated terminal
"nnoremap <leader>tr :50vsp term://zsh<CR>
"nnoremap <leader>ty :50vsp term://bpython<CR>
"tnoremap <leader>e <c-\><c-n>
":au BufEnter * if &buftype == 'terminal' | :startinsert | endif

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

" }

" --> Plugins {

" --> no-frils {

let g:nofrils_strbackgrounds=1
nmap <leader>fc :NofrilsFocusCode<CR>
nmap <leader>fd :NofrilsFocusComments<CR>

"  }

" --> nerdcommenter {

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

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

let g:SuperTabDefaultCompletionType = "<c-j>"
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
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gd :GoDecls<CR>
autocmd FileType go nmap <leader>cd :GoDeclsDir<CR>
autocmd FileType go nmap <leader>rn :GoRename<space>
autocmd FileType go nmap <leader>gp :GoPlay<space>

" }

" --> delimitMate {

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" }

" --> Syntastic {

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_c_checkers = ['splint', 'make', 'gcc']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_ansible_checkers = ['ansible_lint', 'yamllint']
" let vim-go handle syntax checking
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "passive_filetypes": ["go"] }

nmap <leader>ee :Errors<cr>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5

" }

" --> UltiSnips {

let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style = "google"
let g:UltiSnipsExpandTrigger="<tab>"

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

" --> Jedi {

let g:jedi#force_py_version = 3
"let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = "<leader>jr"

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

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
