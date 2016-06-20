#!/bin/bash

# This is the beginning attempt to script a linux laptop setup,
# basically ripped off from the inimitable Jessie Frazelle
# https://github.com/jfrazelle/dotfiles/blob/master/bin/install.sh

mkdir ~/code
mkdir ~/code/go
mkdir ~/code/python
mkdir ~/code/elixir

# turn off translations, speed up apt-get update
mkdir -p /etc/apt/apt.conf.d
echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations

# Neovim repo
sudo add-apt-repository ppa:neovim-ppa/unstable

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

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
    --no-install-recommends

apt install -y \
    zsh \
    i3 \
    google-chrome-stable \
    tlp tlp-rdw

# oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

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
sudo pip3 install neovim
sudo pip3 install bpython

ln -sf /home/rob/dotfiles/.zshenv /home/rob/.zshenv
ln -sf /home/rob/dotfiles/.zshrc /home/rob/.zshrc
ln -sf /home/rob/dotfiles/.xsessionrc /home/rob/.xsessionrc
ln -sf /home/rob/dotfiles/.Xresources /home/rob/.Xresources
ln -sf /home/rob/dotfiles/.gitconfig /home/rob/.gitconfig
ln -sf /home/rob/dotfiles/.fonts /home/rob/.fonts
ln -sf /home/rob/dotfiles/.bashrc /home/rob/.bashrc
ln -sf /home/rob/dotfiles/.i3/config /home/rob/.config/i3/config
ln -snf /home/rob/dotfiles/.vim /home/rob/.config/nvim
ln -snf /home/rob/dotfiles/.vimrc /home/rob/.config/nvim/init.vim

apt autoremove
apt autoclean
apt clean

# change shell to zsh & reboot
chsh -s `which zsh`
