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
mkdir ~/code/lua
mkdir ~/code/C
mkdir ~/code/ansible
mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
mkdir ~/.config/i3
mkdir ~/.config/ranger

# turn off translations, speed up apt-get update
mkdir -p /etc/apt/apt.conf.d
echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations

# To be able to use add-apt-repository you may need to install software-properties-common
sudo apt install -y software-properties-common

# Neovim repo
sudo add-apt-repository ppa:neovim-ppa/unstable

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# tlp repo
sudo add-apt-repository ppa:linrunner/tlp

# NodeJS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Apt
sudo apt remove --purge vim # necessary to install vim with lua support
sudo apt update
sudo apt -y upgrade

sudo apt install -y \
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
     tlp-rdw \
     tree \
     nodejs \
     htop \
     zeal \
     screen \
     virtualenvwrapper \
     ruby \
     ruby-dev \
     make \
     gcc \
     vagrant \
     virtualbox \
     bridge-utils \
     gnupg2 \
     inetutils-traceroute \
     shellcheck \
     splint \
     dos2unix \
     openvpn \
     clamav \
     spotify-client \
     vim-gnome \
     vim-nox \
     gdebi \
     haveged \
     lua5.3 \
     luarocks

# ZSH
# oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
# zsh history substring search
wget https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh

# Golang
export GO_VERSION=1.7.4
curl -O https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code/go
rm go${GO_VERSION}.linux-amd64.tar.gz

go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/vet
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/golang/lint/golint
go get -u github.com/odeke-em/drive/cmd/drive
go get -u golang.org/x/tools/cmd/cover
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/monochromegane/the_platinum_searcher/...

# Exercism
export EXERCISM_VERSION=2.3.0
wget https://github.com/exercism/cli/releases/download/v${EXERCISM_VERSION}/exercism-linux-64bit.tgz
tar -xzvf exercism-linux-64bit.tgz
mv exercism /usr/local/bin/
rm exercism-linux-64bit.tgz
exercism configure --dir=~/code/exercism

# Python
sudo apt -y install python-pip \
                    python-dev \
                    build-essential \
                    python3-pip
sudo -H pip install --upgrade pip
pip install -r ~/dotfiles/requirements.txt
pip3 install -r ~/dotfiles/requirements3.txt

# npm
sudo npm install g diff-so-fancy

# Tor Browser
export TOR_VERSION=6.0.5
sudo wget https://www.torproject.org/dist/torbrowser/${TOR_VERSION}/tor-browser-linux64-${TOR_VERSION}_en-US.tar.xz
tar -xvJf ~/Downloads/tor-browser-linux64-${TOR_VERSION}_en-US.tar.xz
rm tor-browser-linux64-${TOR_VERSION}_en-US.tar.xz

# Private Internet Access VPN
cd /etc/openvpn
sudo wget https://www.privateinternetaccess.com/openvpn/openvpn.zip
sudo unzip openvpn.zip

# Keybase
curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f

# Travis CI
gem install travis -v 1.8.5 --no-rdoc --no-ri

# MEGASync
sudo apt-get install -y libc-ares2 libcrypto++9v5
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb
sudo gdebi -n megasync-xUbuntu_16.04_amd64.deb

# Base16 colorscheme
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# LuaRocks
sudo luarocks install busted

# symlinks
ln -sf "$HOME/dotfiles/.zshenv" "$HOME/.zshenv"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/prompt.zsh" "$HOME/prompt.zsh"
ln -sf "$HOME/dotfiles/.xsessionrc" "$HOME/.xsessionrc"
ln -sf "$HOME/dotfiles/.Xresources" "$HOME/.Xresources"
ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/.fonts" "$HOME/.fonts"
ln -sf "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
ln -sf "$HOME/dotfiles/.i3/config" "$HOME/.config/i3/config"
ln -sf "$HOME/dotfiles/.gitignore" "$HOME/.gitignore"
ln -sf "$HOME/dotfiles/.dircolors" "$HOME/.dircolors"
ln -sf "$HOME/dotfiles/rc.conf" "$HOME/.config/ranger/rc.conf"
ln -snf "$HOME/dotfiles/.vim" "$HOME/.config/nvim"
ln -snf "$HOME/dotfiles/.vimrc" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
ln -sf "$HOME/dotfiles/functions.zsh" "$HOME/.oh-my-zsh/custom/functions.zsh"
ln -sf "$HOME/dotfiles/.gnupg/gpg.conf" "$HOME/.gnupg/gpg.conf"
ln -sf "$HOME/dotfiles/.gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

sudo apt autoremove
sudo apt autoclean
sudo apt clean

# change shell to zsh
chsh -s "$(which zsh)"

# change colourscheme
base16-eighties

