syntax on
filetype plugin indent on

set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='raven'
set laststatus=2


set cursorline             " have a line indicate the cursor location
set title                  " show title in console title bar
set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set number                 " relative line numbers
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
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
set visualbell

" don't bell or blink
set noerrorbells
set vb t_vb=

set autoindent             " automatic indent new lines
set smartindent            " be smart about it
set wrap                   " wrap lines
set textwidth=80           " lines are automatically wrapped after 80 columns
set nofoldenable           " turn off folding
set colorcolumn=80         " highlight column 80 (where words will wrap)
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set smarttab
set formatoptions+=n       " support for numbered/bullet lists
set virtualedit=block      " allow virtual edit in visual block ..
set linebreak
set tw=500

""" specify syntax highlighting for specific files
autocmd Bufread,BufNewFile *.md set filetype=markdown " Vim interprets .md as 'modula2' otherwise, see :set filetype?

" Rainbow parenthesis always on!
if exists(':RainbowParenthesesToggle')
"   autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
endif

" Change colourscheme when diffing
fun! SetDiffColors()
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
    highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
    highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColors()

" show a visual line under the cursor's current line
set cursorline

" enable all Python syntax highlighting features
let python_highlight_all = 1