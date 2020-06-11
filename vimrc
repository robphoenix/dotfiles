" --> vim-plug {

call plug#begin()

Plug 'honza/vim-snippets'                            " code snippets
Plug 'mhinz/vim-sayonara'                            " easy buffer closing
Plug 'mhinz/vim-startify'                            " fancy start screen
Plug 'ntpeters/vim-better-whitespace'                " better whitespace highlighting and removal
Plug 'Raimondi/delimitMate'                          " auto-insert closing delimiters
Plug 'scrooloose/nerdcommenter'                      " commenting
Plug 'scrooloose/nerdtree'                           " tree explorer
Plug 'SirVer/ultisnips'                              " code snippets
Plug 'tpope/vim-unimpaired'                          " pairs of handy bracket mappings
Plug 'tpope/vim-surround'                            " add quotes/parenthesis etc.
Plug 'tpope/vim-fugitive'                            " git wrapper
Plug 'itchyny/lightline.vim'                         " statusline
Plug 'w0rp/ale'                                      " linter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Vim autocomplete
Plug 'junegunn/fzf.vim'                              " fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'haishanh/night-owl.vim'                        " syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chriskempson/base16-vim'

call plug#end()

" }

" --> Settings {

set nocompatible                   " be iMproved, required
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
set number                         " line numbers
set wildmenu                       " show list instead of just completing
set wildmode=longest,list:longest  " zsh-like autcomplete menu for Ex commands
set wildignore+=*/.git/*,*/tmp/*,*.swp
au FocusLost * :wa                 " Set vim to save the file on focus out
set fileformats=unix,dos,mac       " prefer Unix over Windows over OS 9 formats
set showmatch                      " show matching brackets by flickering
set noshowmode                     " we show the mode on the statusline
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

" Better Completion
" set complete=.,b,u,]
set complete+=kspell
set completeopt=longest,menuone,noselect
set omnifunc=syntaxcomplete#Complete

" save no history or bookmarks in netrw
let g:netrw_dirhistmax = 0

" colorscheme
" export TERM=xterm-256color
if (has("termguicolors"))
 set termguicolors
 set t_Co=256
endif
syntax enable
" colorscheme base16-oceanicnext
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }

" Markdown settings
au Bufread,BufNewFile *.md setlocal filetype=markdown textwidth=80 wrap spell wrapmargin=0

" gitconfig settings
au Bufread,BufNewFile gitconfig setlocal filetype=.gitconfig

" Gitcommit settings
autocmd FileType gitcommit setlocal spell

" YAML settings
au BufNewFile,BufRead *.yaml setlocal ts=2 sw=2 sts=2
au BufNewFile,BufRead *.yml setlocal ts=2 sw=2 sts=2

" JS settings
au BufNewFile,BufRead *.js setlocal ts=2 sw=2 sts=2
" autocmd BufEnter *.{js,jsx,ts,tsx} colorscheme night-owl
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" CSV settings
au! BufNewFile,BufRead *.csv setf csv

" HTML settings
" indent all tags
let g:html_indent_inctags = "html,body,head"

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

" }

" --> Plugins {

" --> fzf {

nmap <silent> <leader>f :Files<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <silent> <leader>h :History<cr>
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

" --> vim-better-whitespace {

highlight ExtraWhitespace ctermbg=white
autocmd BufEnter * EnableStripWhitespaceOnSave
let blacklist = ['markdown', 'md']

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

let g:deoplete#enable_at_startup = 1

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
