" --> vim-plug {

call plug#begin()

Plug 'chriskempson/base16-vim'          " Base16 colourscheme
Plug 'robertmeta/nofrils'               " minimal syntax highlighting
Plug 'tpope/vim-surround'               " Add quotes/parenthesis etc.
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'airblade/vim-gitgutter'           " Gutter markers for Git
Plug 'Raimondi/delimitMate'             " Auto-insert closing delimiters
Plug 'ntpeters/vim-better-whitespace'   " better whitespace highlighting and removal
Plug 'vim-airline/vim-airline'          " Sweet statusline
Plug 'vim-airline/vim-airline-themes'   " Sweet statusline themes
Plug 'tpope/vim-vinegar'
Plug 'jmcantrell/vim-virtualenv'        " Python Virtualenvs
Plug 'w0rp/ale'                         " linter
Plug 'SirVer/ultisnips'                 " Code snippets
Plug 'honza/vim-snippets'               " Code snippets
Plug 'plasticboy/vim-markdown'          " Markdown
Plug 'majutsushi/tagbar'                " Source Code Browser
Plug 'scrooloose/nerdcommenter'         " Commenting
Plug 'mhinz/vim-startify'               " fancy start screen
Plug 'mhinz/vim-sayonara'               " Easy buffer closing
Plug 'mhinz/vim-grepper'                " easy grepping
Plug 'pearofducks/ansible-vim'          " Ansible
Plug 'Rykka/riv.vim'                    " reStructured Text
Plug 'mbbill/undotree'                  " undo history visualizer
Plug 'junegunn/goyo.vim'                " distraction free writing
Plug 'junegunn/limelight.vim'           " section highlighting
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy finder
Plug 'cespare/vim-toml'                 " TOML
Plug 'elzr/vim-json'                    " JSON
Plug 'tpope/vim-unimpaired'             " pairs of handy bracket mappings
Plug 'tpope/vim-capslock'               " Software caps lock
Plug 'rhysd/vim-clang-format'           " C formatting
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

if has('nvim')
    Plug 'Shougo/deoplete.nvim'         " NeoVim autocomplete
    Plug 'zchee/deoplete-jedi'          " Python autocomplete
    Plug 'Rip-Rip/clang_complete'       " C autocomplete
else
    Plug 'Shougo/neocomplete.vim'       " Vim autocomplete
endif

call plug#end()

" }

" --> Settings {

set nocompatible    " be iMproved, required

" Colourscheme
set t_Co=256        " ensure vim uses 256 colours, just in case TERM is not xterm-256color
syntax enable
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

set modifiable                     " make a buffer modifiable
set noruler                        " don't show the cursor position all the time
set showcmd                        " show partial commands in status line and selected characters/lines in visual mode
set nolazyredraw                   " turn off lazy redraw
set noswapfile                     " Don't use swapfile
set nobackup                       " Don't create annoying backup files
set nowritebackup
set splitright                     " Split vertical windows right to the current windows
set splitbelow                     " Split horizontal windows below to the current windows
set autoread                       " Automatically reread changed files without asking me anything
set norelativenumber               " no relative line numbers
set number                         " line numbers
set wildmenu                       " show list instead of just completing
set wildmode=longest,list:longest  " zsh-like autcomplete menu for Ex commands
set wildignore+=*/.git/*,*/tmp/*,*.swp
au FocusLost * :wa                 " Set vim to save the file on focus out
set fileformats=unix,dos,mac       " prefer Unix over Windows over OS 9 formats
set showmatch                      " show matching brackets by flickering
set noshowmode                     " we show the mode with airline
set incsearch                      " show search matches as you type
set hlsearch                       " do highlight found searches
set ch=2                           " command line height
set backspace=2                    " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]         " backspace and cursor keys wrap to
set shortmess+=filmnrxoOtT         " abbrev. of messages (avoids 'hit enter')
set report=0                       " tell us about changes
set nostartofline                  " don't jump to the start of line when scrolling
set laststatus=2                   " always show the status line
set ignorecase                     " ignore case when searching
set autoindent                     " automatic indent new lines
set smartindent                    " be smart about it
set nowrap                         " dont't wrap lines
set showbreak=↪
set scrolljump=5                   " lines to scroll when cursor leaves screen
set scrolloff=3                    " minimum lines to keep above and below cursor
set nofoldenable                   " don't auto fold code
set foldnestmax=10                 " 10 nested fold max
set foldmethod=indent              " fold based on indent
set foldcolumn=1                   " show foldcolumn
set gdefault                       " the /g flag on :s substitutions by default
set autochdir                      " automatically change window's cwd to file's dir
set shiftwidth=4                   " use indents of 4 spaces
set tabstop=4                      " an indentation every four columns
set expandtab                      " tabs are spaces, not tabs
set softtabstop=4                  " let backspace delete indent
set pastetoggle=<F2>               " pastetoggle (sane indentation on pastes)
set smarttab
set formatoptions+=n               " support for numbered/bullet lists
set virtualedit=block              " allow virtual edit in visual block
set linebreak
set noerrorbells                   " don't bell or blink
set hidden                         " hide buffers, don't close
set autowrite                      " Automatically save before :next, :make etc.
set virtualedit=onemore            " allow for cursor beyond last character
set history=1000                   " Store a ton of commands/search history (default is 20)
set nospell                        " spell checking off by default
set spelllang=en_gb                " jolly good spelling chap
set noundofile                     " no annoying .un~ files
set modelines=1
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
filetype plugin indent on

if has('nvim')
    set inccommand=split            " incremental command live feedback
endif

" Better Completion
set complete=.,b,u,]
set complete+=kspell
set completeopt=longest,menuone,noselect
set omnifunc=syntaxcomplete#Complete

" save no history or bookmarks in netrw
" :let g:netrw_dirhistmax = 0

" Markdown settings
au Bufread,BufNewFile *.md setlocal filetype=markdown tw=80 wrap spell

" Article filetype settings (used by Go tour)
au Bufread,BufNewFile *.article setlocal spell

" Gitcommit settings
autocmd FileType gitcommit setlocal spell

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
autocmd BufEnter *.go colorscheme nofrils-dark
autocmd BufLeave *.go colorscheme base16-default-dark

" C settings
au BufNewFile,BufRead *.c setlocal noet ts=2 sw=2 sts=2
autocmd BufEnter *.c colorscheme nofrils-dark
autocmd BufLeave *.c colorscheme base16-default-dark
autocmd BufEnter *.h colorscheme nofrils-dark
autocmd BufLeave *.h colorscheme base16-default-dark

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

" csv settings
au! BufNewFile,BufRead *.csv setf csv

" Thesaurus https://github.com/zeke/moby
set thesaurus+=./.vim/thesaurus.txt

" }

" --> Key (re)Mappings {

" leader key
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" remap ESC
inoremap jk <ESC>

" split navigations
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
" for integrated terminal as well
if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" mute highlighting
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Buffer closing
nnoremap <silent> <leader>q :Sayonara<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Remap L to move to end of line & H to move to beginning
nnoremap L $
vnoremap L $h
onoremap L $
nnoremap H ^
vnoremap H ^
onoremap H ^

" copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

" Visual linewise up and down by default
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" integrated terminal
if has('nvim')
    nnoremap <leader>z :term<CR>
    tnoremap <leader>e <c-\><c-n>
    :au BufEnter * if &buftype == 'terminal' | :startinsert | endif
endif

" substitution (replace) word under cursor
nnoremap <C-s> :%s/<C-r><C-w>//c<left><left>

" navigate & close quickfix easily
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

" resizing splits
nnoremap <silent> <a-h> :vertical resize +10<cr>
nnoremap <silent> <a-l> :vertical resize -10<cr>
nnoremap <silent> <a-j> :res +10<cr>
nnoremap <silent> <a-k> :res -10<cr>

" build current C program, output has same name
autocmd FileType c nnoremap <silent> <leader>cb :!clear;gcc % -o %:r.out<CR>
" cs50 specific command, linking to cs50 lib
autocmd FileType c nnoremap <silent> <leader>50 :!clear;gcc % ~/code/C/cs50/libcs50/src/cs50.c -o %:r.out<CR>

" navigating commands history
cnoremap <c-k> <Up>
cnoremap <c-j> <Down>

" read output of shell commands to file
nnoremap <leader>r :read !

" Goyo & Limelight
nmap <leader>gg :Goyo<CR> :Limelight!!<CR> :<CR><ESC>

" }

" --> Plugins {

" --> ale {

let g:ale_sign_column_always = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

"  }

" --> vim-grepper {

let g:grepper = {}            " initialize g:grepper with empty dictionary
runtime autoload/grepper.vim  " initialize g:grepper with default values
let g:grepper.highlight = 1
let g:grepper.simple_prompt = 1
let g:grepper.tools = ['rg', 'pt', 'git']
let g:grepper.dir = 'repo,file'
nnoremap <leader>s :Grepper<cr>
let g:grepper.next_tool = '<leader>s'

"  }

" --> vim-better-whitespace {

highlight ExtraWhitespace ctermbg=white
autocmd BufEnter * EnableStripWhitespaceOnSave
let blacklist = ['markdown', 'md']

"  }

" --> CtrlP {

" Easy bindings for its various modes
let g:ctrlp_map = ''
nmap <silent> <leader>f :CtrlP<cr>
nmap <silent> <leader>b :CtrlPBuffer<cr>
nmap <silent> <leader>m :CtrlPMRU<cr>

let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:40'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_switch_buffer = 'et'    " jump to a file if it's open already
let g:ctrlp_mruf_max=450            " number of recently opened files
let g:ctrlp_max_files=0             " do not limit the number of searchable files
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_line_prefix = '>'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('rg')
  " set grepprg=rg\ --color=never
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
  let g:ctrlp_use_caching = 0
endif

" }

" --> vim-gitgutter {

let g:gitgutter_map_keys = 0

"  }

" --> undotree {

nnoremap <leader>u :UndotreeToggle<CR>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 60
let g:undotree_SetFocusWhenToggle = 1

"  }

" --> nerdcommenter {

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" }

" --> tagbar {

nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 50

" }

" --> no-frils {

let g:nofrils_strbackgrounds=1

"  }

" --> vim-virtualenv {

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

"  }

" --> vim-airline {

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
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

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.paste = 'ρ'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#syntastic#enabled = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#capslock#enabled = 1

" let g:airline_section_b = ''
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_z = ''
" let g:airline_section_z = '%l/%L:%c'

"  }

" --> ansible-vim {

let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1

"  }

" --> clang-format {

let g:clang_format#auto_format=1
let g:clang_format#auto_format_on_insert_leave=0
let g:clang_format#code_style='llvm'

"  }

" --> vim-go {

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_term_width = 30
let g:go_snippet_engine = "ultisnips"
let g:go_gorename_prefill = 0
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0
set updatetime=100

au FileType go nmap <leader>gi <Plug>(go-info)
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gk <Plug>(go-doc)
au FileType go nmap <leader>gn <Plug>(go-rename)
au FileType go nmap <leader>gl <Plug>(go-metalinter)
au FileType go nmap <leader>gs :GoSameIds<CR>
au FileType go nmap <leader>gd :GoDeclsDir<CR>

" use :A/:AV/:AS to alternate between code & test files
augroup go
    autocmd!
    autocmd Filetype go
        \  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
        \| command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
        \| command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END
" }

" --> delimitMate {

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" }

" --> UltiSnips {

let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style = 'google'
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
inoremap <c-x><c-k> <c-x><c-k>

" }

" --> Autocompletion {

if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
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

" --> clang-complete {

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_auto_select=2
let g:clang_complete_copen=0
let g:clang_snippets=0
let g:clang_snippets_engine='ultisnips'
let g:clang_close_preview=1

"  }

" --> jedi-vim {

let g:jedi#force_py_version = 3
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>ju"

" }

" --> vim-fugitive {

nnoremap <leader>ge :Git add --all<CR>
nnoremap <leader>ga :Git add %:p<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

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

" }

" --> vim-markdown {

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0

" }

" Modeline
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
