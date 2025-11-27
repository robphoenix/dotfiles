" --> vim-plug {

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

" Plug 'SirVer/ultisnips'                              " code snippets
Plug 'honza/vim-snippets'                            " code snippets
Plug 'mhinz/vim-sayonara'                            " easy buffer closing
Plug 'ntpeters/vim-better-whitespace'                " better whitespace highlighting and removal
Plug 'preservim/nerdcommenter'                       " commenting
Plug 'preservim/nerdtree'                            " tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin'                   " NERDTree git status
Plug 'tpope/vim-unimpaired'                          " pairs of handy bracket mappings
Plug 'tpope/vim-surround'                            " add quotes/parenthesis etc.
Plug 'itchyny/lightline.vim'                         " statusline
Plug 'itchyny/vim-gitbranch'
Plug 'mattn/emmet-vim'                               " emmet
Plug 'ap/vim-css-color'                              " CSS color highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}      " autocompletion
Plug 'mhinz/vim-startify'                            " fancy start screen
Plug 'ctrlpvim/ctrlp.vim'                            " file/buffer opening
Plug 'mileszs/ack.vim'                               " search
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ggandor/lightspeed.nvim'                       " motion plugin
Plug 'folke/trouble.nvim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
" colorschemes
Plug 'haishanh/night-owl.vim'
Plug 'romainl/flattened'
Plug 'EdenEast/nightfox.nvim'
" language syntax/support
Plug 'HerringtonDarkholme/yats.vim'                  " TypeScript syntax
Plug 'pangloss/vim-javascript'                       " JavaScript support
Plug 'yuezk/vim-js'                                  " JavaScript syntax
Plug 'maxmellon/vim-jsx-pretty'                      " JS and JSX syntax
Plug 'jxnblk/vim-mdx-js'                             " MDX Syntax
Plug 'jparise/vim-graphql'                           " GraphQL syntax
Plug 'preservim/vim-markdown'                        " Markdown syntax

call plug#end()

" }

" --> Settings {

set encoding=UTF-8
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
set relativenumber                 " relative line numbers
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
set shortmess+=filmnrxoOtTc        " abbrev. of messages (avoids 'hit enter')
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
set re=0                           " yats recommended setting
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
if (has("termguicolors"))
 set termguicolors
 set t_Co=256
endif
syntax enable
set background=dark
" set background=light
colorscheme nightfox
" colorscheme flattened_light
" colorscheme solarized
" colorscheme night-owl

nnoremap <F3> :call ToggleBackground()<CR>

function! ToggleBackground()
    if &background == "dark"
        set background=light
        colorscheme flattened_light
    else
        set background=dark
        colorscheme nightfox
    endif
endfunction

" Markdown settings
au Bufread,BufNewFile *.md setlocal filetype=markdown textwidth=80 wrap spell wrapmargin=0
" au Bufread,BufNewFile *.mdx setlocal filetype=mdx textwidth=80 wrap spell wrapmargin=0
let g:markdown_fenced_languages = ['html', 'css', 'shell', 'console', 'javascript', 'jsx', 'typescript', 'tsx']

" gitconfig settings
au Bufread,BufNewFile gitconfig setlocal filetype=.gitconfig

" Gitcommit settings
autocmd FileType gitcommit setlocal spell

" YAML settings
au BufNewFile,BufRead *.yaml setlocal ts=2 sw=2 sts=2
au BufNewFile,BufRead *.yml setlocal ts=2 sw=2 sts=2
autocmd BufNewFile,BufRead .prettierrc set ft=yaml

" JS settings
au BufNewFile,BufRead *.js setlocal ts=2 sw=2 sts=2

" CSV settings
au! BufNewFile,BufRead *.csv setf csv

" HTML settings
" indent all tags
let g:html_indent_inctags = "html,body,head"
" Set HTML syntax for odd filetypes
" autocmd BufNewFile,BufRead *.njk   set syntax=htmldjango
" autocmd BufNewFile,BufRead *.njk   set ft=html
" autocmd BufNewFile,BufRead *.njk.html   set syntax=htmldjango ft=nunjucks
autocmd BufNewFile, BufRead *.html set syntax=htmldjango ft=htmldjango ts=2 sw=2 sts=2
" autocmd BufNewFile,BufRead *.html.twig   set syntax=htmldjango
" Format on save
" autocmd BufWritePost *.html silent :Format

" }

" --> Key (re)Mappings {

" leader key
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" remap ESC
inoremap jk <ESC>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>

" split navigations
nnoremap <c-J> <C-W>j
nnoremap <c-K> <C-W>k
nnoremap <c-L> <C-W>l
nnoremap <c-H> <C-W>h

" in terminal mode
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l

" mute highlighting
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Buffer closing
nnoremap <silent> <leader>q :Sayonara<CR>

" Window closing
" nnoremap <silent> <leader>cw <c-w>c<CR>

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
" vmap <Leader>y "+y
" vmap <Leader>d "+d
" nmap <Leader>p "+p
" nmap <Leader>P "+P
" vmap <Leader>p "+p
" vmap <Leader>P "+P

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
" nnoremap <leader>l :lclose<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" resizing splits
" Alt-h
nnoremap <silent> ˙ :vertical resize -10<cr>
" Alt-l
nnoremap <silent> ¬ :vertical resize +10<cr>
" Alt-j
nnoremap <silent> ∆ :res -10<cr>
" Alt-k
nnoremap <silent> ˚ :res +10<cr>

" navigating commands history
" Alt-k
cnoremap ˚ <Up>
" Alt-j
cnoremap ∆ <Down>

" turn terminal to normal mode with ESC
tnoremap <ESC> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal
fu! OpenTerminal()
    vsplit term://zsh
    vertical resize 80
endf
" nnoremap <leader>tt :terminal<CR>
" nnoremap <leader>tv :call OpenTerminal()<CR>
" " nnoremap <leader>tv :vsplit term://zsh<CR>
" nnoremap <leader>tn :vsplit term://node<CR>

" yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" }

" --> Plugins {
"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

lua << EOF
  require("trouble").setup {
    -- Empty
  }
EOF

"  --> ack/ripgrep {

nnoremap <Leader>s :Ack!<Space>
" Use ripgrep for searching
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --smart-case'
" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!

"  }

"  --> Ctrl-P {

let g:ctrlp_custom_ignore = '\v[\/]\.(git|node_modules)$'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

nmap <silent> <leader>f :CtrlP<cr>
nmap <silent> <leader>b :CtrlPBuffer<cr>
nmap <silent> <leader>h :CtrlPMRU<cr>

"  --> emmet {

" let g:user_emmet_leader_key='<C-N>'

"  }

" --> Startify {

let g:startify_custom_header = [""]
let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Recently used']            },
          \ ]
          " \ { 'type': 'sessions',  'header': ['   Sessions']       },
          " \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          " \ { 'type': 'commands',  'header': ['   Commands']       },
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

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
let NERDTreeMinimalMenu=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=50
let NERDTreeIgnore=['\.git$', '\~$', '\.DS_Store']

"  }

"  --> vim-visual-multi {

let g:VM_maps                    = {}
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"]   = '<C-k>'

" }

"  --> lightline {

" To enable the lightline theme
    " \ 'colorscheme': 'solarized',
    " \ 'colorscheme': 'nightfox',
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
     \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'filetype' ] ]
    \ },
 \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
    \   'filename': 'LightlineFilename',
    \ },
\ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" }

" --> coc {

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-stylelint',
  \ 'coc-tsserver',
  \ 'coc-lists',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-htmldjango',
  \ 'coc-snippets',
  \ ]

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" scroll diagnostics view
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nnoremap <silent><nowait> <leader>p  :<C-u>Format<cr>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" DjHTML format (11ty/nunjucks)
command! -nargs=0 Djhtml :CocCommand htmldjango.djhtml.format

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>aa :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols. t for tags
" nnoremap <silent><nowait> <leader>t  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

let g:coc_filetype_map = { 'html': 'html' }

" }

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
" JSX comments
" use <leader>ca to use alternative set of delimiters
let g:NERDCustomDelimiters={ 'typescriptreact': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' }, 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

" }

