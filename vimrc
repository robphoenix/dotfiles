" --> vim-plug {

call plug#begin()

Plug 'airblade/vim-gitgutter'                        " gutter markers for Git
Plug 'cespare/vim-toml'                              " TOML
Plug 'chriskempson/base16-vim'                       " base16 colourscheme
Plug 'elzr/vim-json'                                 " JSON
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }  " go development
Plug 'gabrielelana/vim-markdown'                     " markdown support
Plug 'godlygeek/tabular'                             " text alignment
Plug 'godoctor/godoctor.vim'                         " go refactoring
Plug 'honza/vim-snippets'                            " code snippets
Plug 'jmcantrell/vim-virtualenv'                     " python virtualenvs
Plug 'jreybert/vimagit'                              " emacs magit mode
Plug 'junegunn/goyo.vim'                             " distraction free writing
Plug 'junegunn/fzf.vim'                              " fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kassio/neoterm'                                " terminal REPL
Plug 'majutsushi/tagbar'                             " source code browser
Plug 'mattn/emmet-vim'                               " HTML
Plug 'mbbill/undotree'                               " undo history visualizer
Plug 'mhinz/vim-sayonara'                            " easy buffer closing
Plug 'mhinz/vim-startify'                            " fancy start screen
Plug 'munshkr/vim-tidal'                             " tidalcycles
Plug 'ntpeters/vim-better-whitespace'                " better whitespace highlighting and removal
Plug 'pearofducks/ansible-vim'                       " ansible
Plug 'Raimondi/delimitMate'                          " auto-insert closing delimiters
Plug 'reedes/vim-colors-pencil'                      " colours for markdown
Plug 'rhysd/vim-clang-format'                        " C formatting
Plug 'robertmeta/nofrils'                            " minimal syntax highlighting
Plug 'Rykka/riv.vim'                                 " reStructured Text
Plug 'scrooloose/nerdcommenter'                      " commenting
Plug 'scrooloose/nerdtree'                           " tree explorer
Plug 'SirVer/ultisnips'                              " code snippets
Plug 'tpope/vim-unimpaired'                          " pairs of handy bracket mappings
Plug 'tpope/vim-capslock'                            " software caps lock
Plug 'tpope/vim-surround'                            " add quotes/parenthesis etc.
Plug 'tpope/vim-fugitive'                            " git wrapper
Plug 'vimlab/split-term.vim'                         " easier Neovim :terminal
Plug 'vim-airline/vim-airline'                       " sweet statusline
Plug 'vim-airline/vim-airline-themes'                " sweet statusline themes
Plug 'vim-erlang/vim-erlang-tags'                    " erlang Support
Plug 'vim-erlang/vim-erlang-runtime'                 " erlang Support
Plug 'vim-erlang/vim-erlang-omnicomplete'            " erlang Support
Plug 'vim-erlang/vim-erlang-compiler'                " erlang Support
Plug 'vim-scripts/TaskList.vim'                      " list TODOs
Plug 'w0rp/ale'                                      " linter
Plug 'Xuyuanp/nerdtree-git-plugin'                   " git markers in nerdtree

if has('nvim')
    Plug 'jodosha/vim-godebug'                       " go debugging
    Plug 'Rip-Rip/clang_complete'                    " C autocomplete
    Plug 'Shougo/deoplete.nvim'                      " neovim autocomplete
    Plug 'zchee/deoplete-jedi'                       " python autocomplete
    Plug 'zchee/deoplete-go', { 'do': 'make'}        " go autocomplete
else
    Plug 'Shougo/neocomplete.vim'                    " Vim autocomplete
endif

call plug#end()

" }

" --> Settings {

set nocompatible    " be iMproved, required
set listchars=eol:$,tab:▸\,
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
set nonumber                       " no line numbers
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
set nowrap                         " don't wrap lines
set showbreak=↪
set scrolljump=5                   " lines to scroll when cursor leaves screen
set scrolloff=3                    " minimum lines to keep above and below cursor
set nofoldenable                   " don't auto fold code
set foldnestmax=10                 " 10 nested fold max
set foldmethod=syntax              " fold based on syntax
set foldcolumn=1                   " show foldcolumn
set gdefault                       " the /g flag on :s substitutions by default
set noautochdir                      " automatically change window's cwd to file's dir
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
set diffopt+=vertical              " vertical Gdiff
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
filetype plugin indent on

" Neovim specific
if has('nvim')
    " incremental command live feedback
    set inccommand=split
    " Prefer Neovim terminal insert mode to normal mode.
    autocmd BufEnter term://* startinsert
endif

" Better Completion
" set complete=.,b,u,]
set complete+=kspell
set completeopt=longest,menuone,noselect
set omnifunc=syntaxcomplete#Complete

" save no history or bookmarks in netrw
let g:netrw_dirhistmax = 0

" Colourscheme
set t_Co=256        " ensure vim uses 256 colours, just in case TERM is not xterm-256color
syntax enable
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark

au VimEnter,BufRead,BufNewFile *.tidal set filetype=haskell.tidal

" Markdown settings
au Bufread,BufNewFile *.md setlocal filetype=markdown textwidth=80 wrap spell wrapmargin=0
autocmd BufEnter *.md colorscheme pencil | let g:airline_theme = 'pencil'
autocmd BufLeave *.md colorscheme base16-default-dark | let g:airline_theme = 'base16'

" gitconfig settings
au Bufread,BufNewFile gitconfig setlocal filetype=.gitconfig

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

" YAML settings
au BufNewFile,BufRead *.yaml setlocal ts=2 sw=2 sts=2
au BufNewFile,BufRead *.yml setlocal ts=2 sw=2 sts=2

" lua settings
au BufNewFile,BufRead *.lua setlocal ts=2 sw=2 sts=2

" JS settings
au BufNewFile,BufRead *.js setlocal ts=2 sw=2 sts=2

" CSV settings
au! BufNewFile,BufRead *.csv setf csv

" HTML settings
" indent all tags
let g:html_indent_inctags = "html,body,head"

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

" Neovim terminal
if has('nvim')
    " integrated zsh terminal
    nnoremap <A-z> :VTerm<space>
    " escape from the Neovim terminal.
    tnoremap <ESC> <C-\><C-n>
    " Make navigation into and out of Neovim terminal splits nicer.
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
endif

" mute highlighting
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Buffer closing
nnoremap <silent> <leader>q :Sayonara<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Jump to last edited file
nnoremap <BS> <C-^>

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

" substitution (replace) word under cursor
nnoremap <C-s> :%s/<C-r><C-w>//c<left><left>

" close quickfix easily
" navigation is taken care of by unimpaired
nnoremap <leader>a :cclose<CR>

" close location list
nnoremap <leader>l :lclose<CR>

" Make
nnoremap <a-m> :make<CR>

" build current C program, output has same name
autocmd FileType c nnoremap <silent> <leader>cb :!clear;gcc % -o %:r.out<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

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

" Goyo & Limelight
nmap <F5> :Goyo<CR>

" }

" --> Plugins {

" --> neoterm {

nnoremap <silent> <leader>tt :T tidal<cr>
nnoremap <silent> <leader>tf :TREPLSendFile<cr>
nnoremap <silent> <leader>tl :TREPLSendLine<cr>
vnoremap <silent> <leader>ts :TREPLSendSelection<cr>

let g:neoterm_autoscroll=1

"  }

" --> vimagit {

let g:magit_show_help=0
let g:magit_default_show_all_files=0

"  }

" --> NERDTree {

map - :NERDTreeFind<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeChDirMode=2
let NERDTreeMarkBookmarks=0
let NERDTreeQuitOnOpen=1
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$']

"  }

" --> ale {

let g:ale_sign_column_always = 1
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

"  }

" --> vim-better-whitespace {

highlight ExtraWhitespace ctermbg=white
autocmd BufEnter * EnableStripWhitespaceOnSave
let blacklist = ['markdown', 'md']

"  }

" --> fzf {

nmap <silent> <leader>f :Files<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <silent> <leader>m :History<cr>
nmap <silent> <leader>s :Find<cr>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)

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

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

"  }

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

nnoremap <silent> <leader>ot :TagbarToggle<CR>
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

"  }

" --> vim-go et al {

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_term_width = 30
let g:go_snippet_engine = "ultisnips"
let g:go_gorename_prefill = 0
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
set updatetime=100

au FileType go nmap <leader>gi <Plug>(go-info)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt :VTerm gotest -v -cover<CR>
au FileType go nmap <leader>gl <Plug>(go-metalinter)
au FileType go nmap <leader>gd :GoDecls<CR>
au FileType go nmap <leader>gs :GoDeclsDir<CR>
" use godoctor for refactoring
au FileType go nmap <leader>gr :Rename<CR>

" use :A/:AV/:AS to alternate between code & test files
" buffer/vertical split/horizontal split
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
    " deoplete.nvim recommend
    set completeopt+=noselect
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

" --> deoplete-go {

let g:deoplete#sources#go#gocode_binary = '/home/rob/Dropbox/code/gopath/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

"  }

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

let g:startify_session_dir = '~/Dropbox/dotfiles/nvim/session'
let g:startify_session_persistence = 1
let g:startify_session_sort = 1
let g:startify_list_order = [
            \ ['   Current directory:'],
            \ 'dir',
            \ ['   Most recently used'],
            \ 'files',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ]
let g:startify_files_number = 8
let g:startify_change_to_dir = 1
let g:startify_enable_special = 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_header = ['']

" }

" Modeline
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
