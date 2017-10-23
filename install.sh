#!/bin/bash

# This is the beginning attempt to script a linux laptop setup,
# basically ripped off from the inimitable Jessie Frazelle
# https://github.com/jfrazelle/dotfiles/blob/master/bin/install.sh

TODO: update dir creation
# mkdir ~/code
# mkdir ~/code/go
# mkdir ~/code/go/src
# mkdir ~/code/go/pkg
# mkdir ~/code/go/bin
# mkdir ~/code/python
# mkdir ~/code/lua
# mkdir ~/code/C
# mkdir ~/code/ansible
# mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
# mkdir ~/.config/i3
# mkdir ~/.config/ranger

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
     bridge-utils \
     gnupg2 \
     inetutils-traceroute \
     shellcheck \
     splint \
     dos2unix \
     openvpn \
     vim-gnome \
     vim-nox \
     gdebi \
     lua5.3 \
     luarocks \
     cmus \
     clang \
     libclang-dev \
     clang-format \
     rofi

# ZSH
# oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
# zsh auto-suggestions
git clone git://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Go
export GO_VERSION=1.9
curl -O https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Dropbox/code/gopath
rm go${GO_VERSION}.linux-amd64.tar.gz

go get -u golang.org/x/tools/cmd/cover
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/tools
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/vet
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/gotype
go get -u github.com/golang/lint/golint
go get -u github.com/golang/dep/...
go get -u github.com/mitchellh/gox
go get -u github.com/tcnksm/ghr
go get -u golang.org/x/review/git-codereview
go get -u honnef.co/go/tools/cmd/staticcheck
go get -u github.com/posener/complete/gocomplete
gocomplete -y -install

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Rust
curl https://sh.rustup.rs -sSf | sh
cargo install ripgrep
cargo install fd-find

# Python
sudo apt -y install python-pip \
                    python-dev \
                    build-essential \
                    python3-pip
sudo -H pip install --upgrade pip
pip install -r ~/dotfiles/requirements.txt
pip3 install -r ~/dotfiles/requirements3.txt

# npm
sudo npm install -g diff-so-fancy
sudo npm install -g tldr

# RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

# Rubygems
sudo gem install tmuxinator

# Private Internet Access VPN
cd /etc/openvpn
sudo wget https://www.privateinternetaccess.com/openvpn/openvpn.zip
sudo unzip openvpn.zip

# Base16 colorscheme
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# LuaRocks
sudo luarocks install busted

# GitHub Hub
export HUB_VERSION=2.3.0-pre9
wget https://github.com/github/hub/releases/download/v${HUB_VERSION}/hub-linux-amd64-${HUB_VERSION}.tgz
tar zxvf hub-linux-amd64-${HUB_VERSION}.tgz
sudo ./hub-linux-amd64-${HUB_VERSION}/install
mkdir -p ~/.zsh/completions
mv ./hub-linux-amd64-${HUB_VERSION}/etc/hub.zsh_completion ~/.zsh/completions/_hub
rm -rf hub-linux-amd64-${HUB_VERSION}
rm hub-linux-amd64-${HUB_VERSION}.tgz

# symlinks
ln -sf "$HOME/Dropbox/dotfiles/zshenv" "$HOME/.zshenv"
ln -sf "$HOME/Dropbox/dotfiles/zshrc" "$HOME/.zshrc"
ln -sf "$HOME/Dropbox/dotfiles/prompt.zsh" "$HOME/prompt.zsh"
ln -sf "$HOME/Dropbox/dotfiles/xsessionrc" "$HOME/.xsessionrc"
ln -sf "$HOME/Dropbox/dotfiles/Xresources" "$HOME/.Xresources"
ln -sf "$HOME/Dropbox/dotfiles/gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/Dropbox/dotfiles/i3/config" "$HOME/.config/i3/config"
ln -sf "$HOME/Dropbox/dotfiles/gitignore" "$HOME/.gitignore"
ln -sf "$HOME/Dropbox/dotfiles/rc.conf" "$HOME/.config/ranger/rc.conf"
ln -sf "$HOME/Dropbox/dotfiles/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
ln -sf "$HOME/Dropbox/dotfiles/functions.zsh" "$HOME/.oh-my-zsh/custom/functions.zsh"
ln -sf "$HOME/Dropbox/dotfiles/secrets.zsh" "$HOME/.oh-my-zsh/custom/secrets.zsh"
ln -sf "$HOME/Dropbox/dotfiles/gnupg/gpg.conf" "$HOME/.gnupg/gpg.conf"
ln -sf "$HOME/Dropbox/dotfiles/gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
ln -sf "$HOME/Dropbox/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/Dropbox/dotfiles/tmuxinator" "$HOME/.tmuxinator"
ln -sf "$HOME/Dropbox/dotfiles/ranger" "$HOME/.config/ranger/rc.conf"
ln -snf "$HOME/Dropbox/dotfiles/fonts" "$HOME/.fonts"
ln -snf "$HOME/Dropbox/dotfiles/nvim" "$HOME/.config/nvim"
ln -snf "$HOME/Dropbox/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"

sudo apt autoremove
sudo apt autoclean
sudo apt clean

# change shell to zsh
chsh -s "$(which zsh)"

# change colourscheme
base16-eighties
