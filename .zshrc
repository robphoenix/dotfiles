export ZSH=/home/rob/.oh-my-zsh

ZSH_THEME="ysb"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(z extract ssh-agent thefuck virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Python virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

# solarized dir colours
eval `dircolors ~/.dircolors`

# vi mode in the terminal
set -o vi

