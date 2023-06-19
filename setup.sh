#!/usr/bin/env bash

# reference: https://github.com/jalexanderfox/dotfiles/blob/master/setup_brew.sh

# Ask for the administrator password upfront.
# sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Brew
# Check for Homebrew,
# Install if we don't have it
# if test ! $(which brew); then
  # echo "Installing homebrew..."
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

# Update homebrew recipes
# brew update

# Upgrade any already-installed formulae.
# brew upgrade

# List of binaries to install
# sshfs
# binaries=(
#   bat
#   gh
#   neovim
#   node
#   python
#   ripgrep
#   trash
#   tree
#   z
#   zsh-completions
#   zsh-syntax-highlighting
# )
#
# echo "installing binaries..."
# brew install ${binaries[@]}
#
# brew tap homebrew/cask-fonts #You only need to do this once for cask-fonts
# brew install --cask font-fantasque-sans-mono

# Cleanup
# brew cleanup

# Install Oh My ZSH
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlinks
ln -sf "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zshenv" "$HOME/.zshenv"
ln -sf "$HOME/dotfiles/git-prompt.sh" "$HOME/git-prompt.sh"
ln -sf "$HOME/dotfiles/prompt.zsh" "$HOME/prompt.zsh"
ln -sf "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/gitignore" "$HOME/.gitignore"
ln -sf "$HOME/dotfiles/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
ln -sf "$HOME/dotfiles/functions.zsh" "$HOME/.oh-my-zsh/custom/functions.zsh"
ln -sf "$HOME/dotfiles/secrets.zsh" "$HOME/.oh-my-zsh/custom/secrets.zsh"
ln -sf "$HOME/dotfiles/nvim" "$HOME/.config/nvim"

# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# npm install -g corepack
# pip3 install --upgrade pynvim
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

