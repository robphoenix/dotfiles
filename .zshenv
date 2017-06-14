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
# disable virtualenvwrapper prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# GOPATH
export GOPATH=$HOME/code/gopath
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# CDPATH
export CDPATH=$GOPATH:~/code/python:~/sites:~/code/exercism:~/code/lua

# FZF
export FZF_COMPLETION_TRIGGER=',,'
export FZF_DEFAULT_OPTS='--height 50% --reverse'
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
