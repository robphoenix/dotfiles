env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

# z
. ~/z.sh
alias j="z"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Always use color output for `ls`
alias ls="command ls --color"
# List only directories
alias lsd="ls -lF --color | grep --color=never '^d'"
alias l="LC_COLLATE=C ls -lAhF -I.dropbox -I.dropbox.cache -I.cache -I__pycache__ -I.git -Inode_modules -I.vagrant -I.DS_Store --group-directories-first"
alias la="ls -laF --color"
alias mv="mv -ivu"
alias cp="cp -ivu"

alias relo="source ~/.bashrc"

PS1="\w ❯ "

