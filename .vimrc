" --> vim-plug {

call plug#begin()

Plug 'chriskempson/base16-vim'          " Base16 colourscheme
Plug 'robertmeta/nofrils'               " minimal syntax highlighting
Plug 'tpope/vim-surround'               " Add quotes/parenthesis etc.
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'airblade/vim-gitgutter'           " Gutter markers for Git
Plug 'Xuyuanp/nerdtree-git-plugin'      " Git gutter markers in NERDTree
Plug 'ntpeters/vim-better-whitespace'   " Remove whitespace
Plug 'Raimondi/delimitMate'             " Auto-insert closing delimiters
Plug 'vim-airline/vim-airline'          " Sweet statusline
Plug 'vim-airline/vim-airline-themes'   " Sweet statusline themes
Plug 'scrooloose/nerdtree'              " File explorer
Plug 'jmcantrell/vim-virtualenv'        " Python Virtualenvs
Plug 'scrooloose/syntastic'             " Syntax checker
Plug 'SirVer/ultisnips'                 " Code snippets
Plug 'honza/vim-snippets'               " Code snippets
Plug 'plasticboy/vim-markdown'          " Markdown
Plug 'majutsushi/tagbar'                " Source Code Browser
Plug 'mhinz/vim-startify'               " Fancy start screen
Plug 'terryma/vim-expand-region'        " Visually select increasingly larger regions of text using the same key combination
Plug 'ervandew/supertab'                " Use tab to for completions
Plug 'scrooloose/nerdcommenter'         " Commenting
Plug 'Yggdroot/indentLine'              " Visualize indentation levels
Plug 'mhinz/vim-sayonara'               " Easy buffer closing
Plug 'Konfekt/FastFold'                 " Fold updating
Plug 'fatih/vim-go'                     " Golang
Plug 'pearofducks/ansible-vim'          " Ansible
Plug 'Chiel92/vim-autoformat'           " Code formatting
Plug 'Rykka/riv.vim'                    " reStructured Text
Plug 'mbbill/undotree'                  " undo history visualizer
Plug 'junegunn/goyo.vim'                " distraction free writing
Plug 'junegunn/limelight.vim'           " section highlighting
Plug 'ctrlpvim/ctrlp.vim'               " fuzzy finder
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim'         " NeoVim autocomplete
    Plug 'zchee/deoplete-go'            " Go autocomplete
    Plug 'zchee/deoplete-jedi'          " Python autocomplete
    Plug 'crosbymichael/vim-cfmt'       " Auto-format C code
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

set ruler                          " show the cursor position all the time
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
au FocusLost * :wa                 " Set vim to save the file on focus out.
set fileformats=unix,dos,mac       " Prefer Unix over Windows over OS 9 formats
set noshowmatch                    " Do not show matching brackets by flickering
set noshowmode                     " We show the mode with lightline
set incsearch                      " Shows the match while typing
set hlsearch                       " Highlight found searches
set ch=2                           " command line height
set backspace=2                    " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]         " backspace and cursor keys wrap to
set shortmess+=filmnrxoOtT         " abbrev. of messages (avoids 'hit enter')
set report=0                       " tell us about changes
set nostartofline                  " don't jump to the start of line when scrolling
set incsearch                      " show search matches as you type
set laststatus=2                   " always show the status line
set ignorecase                     " ignore case when searching
set hlsearch                       " highlight searches
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
set cursorline                     " let's highlight the line the cursor is on
set colorcolumn=79,119             " highlight columns
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

if has('nvim')
    set inccommand=split            " incremental command live feedback
endif

" Better Completion
set complete=.,b,u,]
set completeopt=longest,menuone,noselect
set omnifunc=syntaxcomplete#Complete

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

" Thesaurus https://github.com/zeke/moby
set thesaurus+=./.vim/thesaurus.txt

" }

" --> Key (re)Mappings {

" leader key
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" remap ESC
inoremap jk <ESC>

" easily edit .vimrc in new buffer
nmap <leader>vv :edit $MYVIMRC<CR>
nmap <leader>vs :source $MYVIMRC<CR>

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

" Remap - to move to end of line (0 to move to beginning)
nnoremap - $
vnoremap - $h
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

if has('nvim')
    " integrated terminal
    nnoremap <leader>z :15sp term://zsh<CR>
    tnoremap <leader>e <c-\><c-n>
    :au BufEnter * if &buftype == 'terminal' | :startinsert | endif
    " split navigations
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" resizing splits
nnoremap <silent> <a-h> :vertical resize +10<cr>
nnoremap <silent> <a-l> :vertical resize -10<cr>
nnoremap <silent> <a-j> :res +10<cr>
nnoremap <silent> <a-k> :res -10<cr>

" build current C program, output has same name
autocmd FileType c nnoremap <silent> <leader>mc :!clear;gcc % -o %:r.out<CR>

" navigating commands history
cnoremap <c-k> <Up>
cnoremap <c-j> <Down>

" read output of shell commands to file
nnoremap <leader>r :read !

" vim-plug
nnoremap <silent> <a-p> :PlugUpgrade<CR> :PlugClean<CR> :PlugUpdate<CR>

" Goyo & Limelight
nmap <c-g> :Goyo<CR> :Limelight!!<CR> :<CR><ESC>

" }

" --> Plugins {

" --> fzf.vim {

" Use ripgrep to search
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nmap <silent> <leader>s :Rg<CR>
nmap <silent> <leader>i :Colors<CR>

"  }

" --> CtrlP {

" Easy bindings for its various modes
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
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
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

" --> vim-autoformat {

let g:formatter_yapf_style = 'google'
au BufWrite *.py,*.js,*.lua,*.json :Autoformat

" }

" --> tagbar {

nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

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

let g:airline#extensions#tagbar#flags = 'f'

let g:airline_section_z = '%l/%L:%c'

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

let g:SuperTabDefaultCompletionType = "context"
" we need to remap this to not interfere with delimitMate
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<a-tab>'

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
let NERDTreeWinSize = 30

" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }

" --> vim-go {

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_autodetect_gopath = 1
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

autocmd FileType go nmap <leader>gl <Plug>(go-metalinter)
autocmd FileType go nmap <leader>gr <Plug>(go-run-split)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>gd :GoDecls<CR>
autocmd FileType go nmap <leader>gf :GoDeclsDir<CR>
autocmd FileType go nmap <leader>gn :GoRename<space>

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
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_c_checkers = ['splint', 'make', 'gcc']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_ansible_checkers = ['ansible_lint', 'yamllint']
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"
let g:syntastic_markdown_checkers = ["markdownlint"]

" }

" --> UltiSnips {

let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style = 'google'
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsJumpBackwardTrigger = '<c-m>'

" }

" --> Autocompletion {

if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
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

" --> jedi-vim {

let g:jedi#force_py_version = 3
let g:jedi#rename_command = "<leader>jr"
let g:jedi#usages_command = "<leader>ju"

" }

" --> Fugitive {

" nnoremap <leader>ga :Git add --all<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
vnoremap <leader>gb :Gblame<CR>

" }

" --> vim-better-whitespace {

" auto strip whitespace except for file with extension blacklisted
let blacklist = ['markdown', 'md']
autocmd BufWritePre * StripWhitespace
highlight ExtraWhitespace ctermbg=Yellow

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

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
