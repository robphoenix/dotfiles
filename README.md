```
                       _      _
           |          | | o  | |
         __|   __ _|_ | |    | |  _   ,
        /  |  /  \_|  |/  |  |/  |/  / \_
        \_/|_/\__/ |_/|__/|_/|__/|__/ \/
                      |\
                      |/
```

I use these across my work and personal machines. On my personal machine I use
Ubuntu with [zsh](http://ohmyz.sh/), [i3](http://i3wm.org/) and [NeoVim](https://neovim.io/), and for
work I use Windows 7 with [zsh](http://ohmyz.sh/), [babun](https://babun.github.io/), tmux & Vim.
On both machines I make things pretty with the classic [Solarized](http://ethanschoonover.com/solarized) colour scheme
and the [Input](http://input.fontbureau.com/) font.

![Prompt](images/prompt.png "Prompt")

## Linux machine

### .fonts

Symlink to this in your `$HOME` directory and you have all the niceness of a
range of fonts. I've been stuck on Input for a while now.

### .i3

This is another thing that comes under the banner of *things I use because
@jessfraz uses it*. Ubuntu is great but I never enjoyed its desktop
environment. For I long time I used Xubuntu, and was too timid to properly look
into a window manager. It was nothing to be scared of, i3 is amazing. While
it did take a little while to get used to, it makes the Linux desktop experience
so much more intuitive and simplified. [These](https://www.youtube.com/watch?v=j1I63wGcvU4&list=PL5ze0DjYv5DbCv9vNEzFmP6sU7ZmkGzcf)
videos from @bookercodes were invaluable for getting things set up.

### .Xresources

This confgures my terminal, rxvt-unicode.

### .dircolours

Sets the output of `ls` to the Solarized colours.

### .init.vim-rplugin~

Something to do with Neovim plugins

### .ranger

Ranger is a terminal file explorer, though I don't find I use it a lot.

### .xsessionrc

This sets the right scale on my laptop, without this everything is really tiny.


## Windows machine

I have the ugly Windows 7 taskbar permanently hidden, thanks to
[this](http://rocketdock.com/addon/misc/3425), but keep access to the Tray with
[this](http://rocketdock.com/addon/docklets/35659), and then use
[RocketDock](http://rocketdock.com).

### .babunrc

This is pretty much just the default configuration file that comes with Babun,
but with the last line making sure we can ignore annoying BLODA warnings.

### .minttyrc

Configures the appearance of the console used by Babun. Applies the Solarized
colour scheme.

### .ptpython

A better Python REPL. On Linux I prefer [bpython](http://bpython-interpreter.org/) though.

### .tmux.conf

I only really have tmux to have a status line and split panes in my Windows
console. I have permanently hidden the Taskbar, and it's nice to have the time
on view. And split panes are so useful, yet Babun doesn't have them. I did use [cmder](http://cmder.net/)
for a while but could never get vim to work properly.


## Cross-machine

I initially had separate dotfiles for my two machines but this very quickly
became a nightmare to manage and avoid discrepancies between them. So, with a
couple of checks whether an environment is Vim or NeoVim, Cygwin or Linux, my
.zshrc & .vimrc now work across both, phew.

### .gnupg

I recently stumbled into using pgp. I have it set up on both machines, though
the gpg-agent doesn't seem to always work. Currently I only have it to get that
groovy Verified tag on my Github commits. But I'm going to read up further about
it.

### .vim

This is the vim goodies. I use [vim-plug](https://github.com/junegunn/vim-plug)
to manage my plugins. I don't include them in version control as they are not
consistent across my machines which causes problems.
Plugins I'm using...


- [ altercation/vim-colors-solarized ](https://github.com/altercation/vim-colors-solarized) " Solarized Colour Scheme
- [ tpope/vim-surround ](https://github.com/tpope/vim-surround)                " Add quotes/parenthesis etc.
- [ tpope/vim-fugitive ](https://github.com/tpope/vim-fugitive)                " Git wrapper
- [ airblade/vim-gitgutter ](https://github.com/airblade/vim-gitgutter)            " Gutter markers for Git
- [ Xuyuanp/nerdtree-git-plugin ](https://github.com/Xuyuanp/nerdtree-git-plugin)       " Git gutter markers in NERDTree
- [ ctrlpvim/ctrlp.vim ](https://github.com/ctrlpvim/ctrlp.vim)                " Fuzzy Finder
- [ ntpeters/vim-better-whitespace ](https://github.com/ntpeters/vim-better-whitespace)    " Remove whitespace
- [ Raimondi/delimitMate ](https://github.com/Raimondi/delimitMate)              " Auto-insert closing delimiters
- [ itchyny/lightline.vim ](https://github.com/itchyny/lightline.vim)             " Sweet statusline
- [ scrooloose/nerdtree ](https://github.com/scrooloose/nerdtree)               " File explorer
- [ klen/python-mode ](https://github.com/klen/python-mode)                  " Python
- [ davidhalter/jedi-vim ](https://github.com/davidhalter/jedi-vim)              " Extra Python
- [ alfredodeza/pytest.vim ](https://github.com/alfredodeza/pytest.vim)            " PyTest wrapper
- [ kien/rainbow_parentheses.vim ](https://github.com/kien/rainbow_parentheses.vim)      " Pretty Parens
- [ scrooloose/syntastic ](https://github.com/scrooloose/syntastic)              " Syntax checker
- [ SirVer/ultisnips ](https://github.com/sirver/UltiSnips)                  " Code snippets
- [ honza/vim-snippets ](https://github.com/honza/vim-snippets)                " Code snippets
- [ godlygeek/tabular ](https://github.com/godlygeek/tabular)                 " Line up tabular data
- [ plasticboy/vim-markdown ](https://github.com/godlygeek/tabular)           " Markdown
- [ majutsushi/tagbar ](https://github.com/majutsushi/tagbar)                 " Overview of Structure
- [ mhinz/vim-startify ](https://github.com/mhinz/vim-startify)                " Fancy start screen
- [ terryma/vim-expand-region ](https://github.com/terryma/vim-expand-region)         " Visually select increasingly larger regions of text using the same key combination
- [ ervandew/supertab ](https://github.com/ervandew/supertab)                 " Use tab to for completions
- [ ap/vim-buftabline ](https://github.com/ap/vim-buftabline)                 " Buffer info in tabs
- [ scrooloose/nerdcommenter ](https://github.com/scrooloose/nerdcommenter)          " Comments
- [ Yggdroot/indentLine ](https://github.com/Yggdroot/indentLine)               " Visualize indentation levels
- [ mhinz/vim-sayonara ](https://github.com/mhinz/vim-sayonara)                " Easy buffer closing
- [ terryma/vim-multiple-cursors ](https://github.com/terryma/vim-multiple-cursors)      " Like Sublime Text
- [ Konfekt/FastFold ](https://github.com/Konfekt/FastFold)                  " Fold updating
- [ fatih/vim-go ](https://github.com/fatih/vim-go)                      " Golang

Linux Only
- [ Shougo/deoplete.nvim ](https://github.com/Shougo/deoplete.nvim)              " NeoVim autocomplete
- [ zchee/deoplete-go ](https://github.com/zchee/deoplete-go)                 " Go autocomplete
- [ crosbymichael/vim-cfmt ](https://github.com/crosbymichael/vim-cfmt)            " Auto-format C code

Windows Only
- [ Shougo/neocomplete.vim ](https://github.com/Shougo/neocomplete.vim)            " Vim autocomplete
- [elixir-lang/vim-elixir](https://github.com/elixir-lang/vim-elixir)            " Elixir

## install.sh

This was initially lifted off Jess Frazelle's install script. It's not usable,
I've never tried it, I don't yet know how to write bash scripts properly, but I
have kept up with listing the programs I install, and I hope one day to tease
this into something useful. But for now, don't use it, goodness knows what havoc
it may wreak!
