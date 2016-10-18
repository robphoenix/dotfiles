# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    # PATH
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
    export PATH=$HOME/bin:$PATH
    export MANPATH="/usr/local/man:$MANPATH"

    # ENVIRONMENT VARIABLES
    export LANG=en_GB.UTF-8
    export TERM=rxvt-unicode-256color
    export SSH_KEY_PATH="~/.ssh/id_rsa"
    export RANGER_LOAD_DEFAULT_RC=FALSE

    # GOPATH
    export GOPATH=$HOME/code/go
    export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

fi
