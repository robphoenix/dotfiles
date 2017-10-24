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

# GOPATH
export GOPATH=$HOME/Dropbox/code/gopath
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# CDPATH
export CDPATH=$GOPATH/src/github.com/robphoenix:$GOPATH/src/github.com/exercism:~/sites:~/Dropbox/code

# Exodus
export PATH="/home/rob/Exodus-linux-x64/:$PATH"

# Haskell
export PATH="/home/rob/.local/bin:$PATH"
