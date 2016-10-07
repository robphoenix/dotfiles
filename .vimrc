" --> vim-plug {
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'klen/python-mode'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-go'
Plug 'Konfekt/FastFold'
Plug 'davidhalter/jedi-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-expand-region'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-sayonara'
Plug 'terryma/vim-multiple-cursors'
Plug 'alfredodeza/pytest.vim'
call plug#end()
" }

" --> Settings {
set nocompatible    " be iMproved, required

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
colorscheme solarized

if !has('gui_running')
  set t_Co=256
endif

set ruler                       " show the cursor position all the time
set showcmd                     " show partial commands in status line and
                                " selected characters/lines in visual mode
set nolazyredraw                " turn off lazy redraw
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autoread                    " Automatically reread changed files without asking me anything
set number                      " line numbers
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
autocmd InsertEnter * setlocal colorcolumn=79,120
autocmd InsertLeave * setlocal colorcolumn=0

" relative line numbers off in insert mode
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set nonumber relativenumber

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
" }

" --> Key (re)Mappings {

" leader key
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

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
nnoremap <leader>z z=<CR>
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

" When jump to next match also center screen
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
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

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

" Some basic refactoring
" from https://github.com/toranb/vimfiles/blob/8c43dc7d705e2405d93a3e797e31d984477d4faf/vimrc#L193
map <leader>rv :call RenameVariable()<cr>

function! GetSelectedText(...)
    try
        let a_save = @a
        if a:0 >= 1 && a:1 == 1
            normal! gv"ad
        else
            normal! gv"ay
        endif
        return @a
    finally
        let @a = a_save
    endtry
endfunction

function! RenameVariable()
    let new_name = input("New variable name: ")
    let old_name = GetSelectedText()
    if new_name != '' && new_name != old_name
        exec ':%s /' . old_name . '/' . new_name . '/gc'
        redraw!
    endif
endfunction

" }

" --> Plugins {

" --> pytest.vim {
nmap <silent><Leader>tp :Pytest project<CR>
nmap <silent><Leader>te :Pytest error<CR>
"  }

" --> SuperTab {
let g:SuperTabDefaultCompletionType = "<tab>"
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

" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Close nerdtree and vim on close file
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }

" --> vim-go {
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
" }

" --> UltiSnips {
" let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsUsePythonVersion = 3
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

" --> Completion {
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
let g:pymode_virtualenv = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_lint_ignore = "E501,F0002"
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
" }

" --> Fugitive {
nnoremap <leader>ga :Git add --all<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gbrowse<CR>
nnoremap <leader>gpm :Gpush origin master<CR>
nnoremap <leader>gpd :Gpush origin dev<CR>
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
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ], [ 'ctrlpmark' ],
      \            [ 'fugitive', 'modified' ]],
      \   'right': [[ 'lineinfo', 'syntastic' ]]
      \ },
      \ 'inactive': {
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'mode': 'LightLineMode',
      \   'modified': 'LightLineModified',
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

function! LightLineInfo()
    return winwidth(0) > 60 ? printf("%-2d", col('.')) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
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
  autocmd BufWritePost *.go,*.py call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
" }

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

" Rainbow parenthesis always on!
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" }

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
