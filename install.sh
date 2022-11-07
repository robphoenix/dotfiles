#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Brew
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

# Upgrade any already-installed formulae.
brew upgrade

# List of binaries to install
# sshfs
binaries=(
  bat
  gh
  git
  iterm
  neovim
  node
  nvm
  python
  ripgrep
  trash
  tree
  yarn
  z
  zsh
  zsh-completions
  zsh-syntax-highlighting
)

echo "installing binaries..."
brew install ${binaries[@]}

# nvm caveats NVM's working directory to your $HOME path (if it doesn't exist):
# mkdir ~/.nvm

# Copy nvm-exec to NVM's working directory
# cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

# Cleanup
brew cleanup

# Symlinks
ln -sf "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/git-prompt.sh" "$HOME/git-prompt.sh"
ln -sf "$HOME/dotfiles/prompt.zsh" "$HOME/prompt.zsh"
ln -sf "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/gitignore" "$HOME/.gitignore"
ln -sf "$HOME/dotfiles/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
ln -sf "$HOME/dotfiles/functions.zsh" "$HOME/.oh-my-zsh/custom/functions.zsh"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
