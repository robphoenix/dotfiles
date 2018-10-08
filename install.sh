#!/bin/bash

# To be able to use add-apt-repository you may need to install software-properties-common
sudo apt install -y software-properties-common

# NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Apt
sudo apt update
sudo apt -y upgrade

sudo apt install -y \
     apt-transport-https \
     ca-certificates \
     xclip \
     zsh \
     tree \
     nodejs \
     shellcheck \
     dos2unix

# ZSH
# oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
# zsh auto-suggestions
git clone git://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Go
export GO_VERSION=1.9.2
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

# npm
sudo npm install -g diff-so-fancy

# symlinks
ln -sf "/mnt/c/dotfiles/zshenv" "$HOME/.zshenv"
ln -sf "/mnt/c/dotfiles/zshrc" "$HOME/.zshrc"
ln -sf "/mnt/c/dotfiles/git-prompt.sh" "$HOME/git-prompt.sh"
ln -sf "/mnt/c/dotfiles/prompt.zsh" "$HOME/prompt.zsh"
ln -sf "/mnt/c/dotfiles/gitconfig" "$HOME/.gitconfig"
ln -sf "/mnt/c/dotfiles/gitignore" "$HOME/.gitignore"
ln -sf "/mnt/c/dotfiles/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
ln -sf "/mnt/c/dotfiles/functions.zsh" "$HOME/.oh-my-zsh/custom/functions.zsh"
ln -sf "/mnt/c/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -snf "/mnt/c/dotfiles/nvim" "$HOME/.config/nvim"
ln -snf "/mnt/c/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"

sudo apt autoremove
sudo apt autoclean
sudo apt clean

# change shell to zsh
chsh -s "$(which zsh)"