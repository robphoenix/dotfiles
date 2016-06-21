#!/bin/bash

# This is the beginning attempt to script a linux laptop setup,
# basically ripped off from the inimitable Jessie Frazelle
# https://github.com/jfrazelle/dotfiles/blob/master/bin/install.sh

mkdir ~/code
mkdir ~/code/go
mkdir ~/code/go/src
mkdir ~/code/go/pkg
mkdir ~/code/go/bin
mkdir ~/code/python
mkdir ~/code/elixir
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}

# turn off translations, speed up apt-get update
mkdir -p /etc/apt/apt.conf.d
echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations

# Neovim repo
sudo add-apt-repository ppa:neovim-ppa/unstable

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# tlp repo
sudo add-apt-repository ppa:linrunner/tlp

# Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

apt update
apt -y upgrade

apt install -y \
    apt-transport-https \
    ca-certificates \
    neovim \
    feh \
    libxss1 \
    libappindicator1 \
    libindicator7 \
    rxvt-unicode-256color \
    ranger \
    caca-utils \
    highlight \
    atool \
    w3m \
    poppler-utils \
    mediainfo \
    xclip \
    exuberant-ctags \
    zsh \
    i3 \
    google-chrome-stable \
    tlp \
    tlp-rdw

# oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# z
curl -sSL https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/z.sh

# Docker
apt-cache policy docker-engine
sudo apt -y install linux-image-extra-$(uname -r)
sudo apt -y install docker-engine
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker rob

# Golang
curl -O https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
tar xvf go1.6.2.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local
rm go1.6.2.linux-amd64.tar.gz

go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/vet
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/golang/lint/golint

# Python
sudo apt -y install python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo apt -y install pip3
sudo apt -y install python3-pip
sudo pip3 install neovim --upgrade
sudo pip3 install jedi
sudo pip install jedi
sudo pip install yapf
sudo pip3 install bpython

# Vim plugins
git clone https://github.com/ctrlpvim/ctrlp.vim ~/.config/nvim/bundle/ctrlp.vim
git clone https://github.com/Raimondi/delimitMate.git ~/.config/nvim/bundle/delimitMate
git clone https://github.com/Shougo/deoplete.nvim.git ~/.config/nvim/bundle/deoplete.nvim
git clone https://github.com/itchyny/lightline.vim.git ~/.config/nvim/bundle/lightline.vim
git clone https://github.com/Shougo/neosnippet.vim.git ~/.config/nvim/bundle/neosnippet.vim
git clone https://github.com/Shougo/neosnippet-snippets.git ~/.config/nvim/bundle/neosnippet-snippets
git clone https://github.com/scrooloose/nerdtree.git ~/.config/nvim/bundle/nerdtree.git
git clone https://github.com/klen/python-mode.git ~/.config/nvim/bundle/python-mode
git clone https://github.com/kien/rainbow_parentheses.vim ~/.config/nvim/bundle/rainbow-parentheses.vim
git clone https://github.com/scrooloose/syntastic.git ~/.config/nvim/bundle/syntastic
git clone https://github.com/bling/vim-bufferline.git ~/.config/nvim/bundle/vim-bufferline
git clone https://github.com/altercation/vim-colors-solarized.git ~/.config/nvim/bundle/vim-colors-solarized
git clone https://github.com/tpope/vim-fugitive.git ~/.config/nvim/bundle/vim-fugitive
git clone https://github.com/fatih/vim-go.git ~/.config/nvim/bundle/vim-go
git clone https://github.com/honza/vim-snippets.git ~/.config/nvim/bundle/vim-snippets
git clone https://github.com/zchee/deoplete-go.git ~/.config/nvim/bundle/deoplete-go
git clone https://github.com/Konfekt/FastFold.git ~/.config/nvim/bundle/FastFold
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.config/nvim/bundle/jedi-vim
git clone https://github.com/scrooloose/nerdcommenter.git ~/.config/nvim/bundle/nerdcommenter
git clone https://github.com/godlygeek/tabular.git ~/.config/nvim/bundle/tabular
git clone git://github.com/airblade/vim-gitgutter.git ~/.config/nvim/bundle/vim-gitgutter
git clone https://github.com/majutsushi/tagbar.git ~/.config/nvim/bundle/tagbar

# Personal repos
git clone git@github.com:bordeltabernacle/exercism.git ~/code/exercism

# symlinks
ln -sf /home/rob/dotfiles/.zshenv /home/rob/.zshenv
ln -sf /home/rob/dotfiles/.zshrc /home/rob/.zshrc
ln -sf /home/rob/dotfiles/.xsessionrc /home/rob/.xsessionrc
ln -sf /home/rob/dotfiles/.Xresources /home/rob/.Xresources
ln -sf /home/rob/dotfiles/.gitconfig /home/rob/.gitconfig
ln -sf /home/rob/dotfiles/.fonts /home/rob/.fonts
ln -sf /home/rob/dotfiles/.bashrc /home/rob/.bashrc
ln -sf /home/rob/dotfiles/.i3/config /home/rob/.config/i3/config
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -snf /home/rob/dotfiles/.vim /home/rob/.config/nvim
ln -snf /home/rob/dotfiles/.vimrc /home/rob/.config/nvim/init.vim

sudo apt autoremove
sudo apt autoclean
sudo apt clean

# change shell to zsh
chsh -s `which zsh`
