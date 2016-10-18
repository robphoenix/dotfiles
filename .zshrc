export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ysb"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

if [[ "$OSTYPE" == "cygwin" ]]; then

    # ENVIRONMENT VARIABLES
    export LANG=en_GB.UTF-8
    export SSH_KEY_PATH="~/.ssh/id_rsa"
    export EDITOR=vim
    export ZSH_TMUX_AUTOSTART=true
    export ZSH_TMUX_AUTOSTART_ONCE=true

    # Python virtualenvwrapper
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export WORKON_HOME="$HOME/.virtualenvs"
    source /usr/local/bin/virtualenvwrapper.sh
    export PROJECT_HOME=$HOME/code/python

    # GOPATH
    export GOPATH=$HOME/code/go
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/code/go/bin

fi

plugins=(z extract ssh-agent thefuck virtualenvwrapper gpg-agent tmux)

source $ZSH/oh-my-zsh.sh

# Python virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh

# solarized dir colours
eval `dircolors ~/.dircolors`

# vi mode in the terminal
set -o vi

# start gpg-agent
gpg-agent

