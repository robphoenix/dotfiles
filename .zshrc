export ZSH=/home/rob/.oh-my-zsh

ZSH_THEME="ysb"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# ZSH_CUSTOM=/path/to/new-custom-folder

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# User configuration

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

plugins=(z extract cp ssh-agent command-not-found thefuck)

source $ZSH/oh-my-zsh.sh
# start in ~/code
cd ~/code

export LANG=en_GB.UTF-8
export TERM=rxvt-unicode-256color
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Python virtualenv
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh
# solarized dir colours
eval `dircolors ~/.dircolors`
# vi mode in the terminal
set -o vi
# thefuck
eval $(thefuck --alias)

# switch back to vim using Ctrl-z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# colorful man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[33m") \
        LESS_TERMCAP_md=$(printf "\e[33m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[0;37;102m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[4;36m") \
        PAGER=/usr/bin/less \
        _NROFF_U=1 \
        PATH=${HOME}/bin:${PATH} \
    man "$@"
}
