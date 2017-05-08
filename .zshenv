# PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export MANPATH="/usr/local/man:$MANPATH"

# ENVIRONMENT VARIABLES
export LANG=en_GB.UTF-8
export TERM=rxvt-unicode-256color
export SSH_KEY_PATH="~/.ssh/id_rsa"
export RANGER_LOAD_DEFAULT_RC=FALSE
export VISUAL=nvim
export EDITOR="$VISUAL"

# PYTHON VIRTUALENVWRAPPER
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=$HOME/code/python

# GOPATH
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GOROOT=/usr/local/go

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# CDPATH
export CDPATH=~:~/code/python:~/code/go/src/github.com/robphoenix/::~/code/go/src/github.com/:~/sites:~/code/exercism:~/code/lua:~/code/python
