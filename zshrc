export ZSH=$HOME/.oh-my-zsh

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
HISTCONTROL=ignoredups:ignorespace
HISTFILE=$HOME/.zsh_history
HISTSIZE=2000

plugins=(\
    colored-man-pages \
    ssh-agent \
    z \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
)

source $ZSH/oh-my-zsh.sh

# PROMPT
#
# git status
# https://github.com/lyze/posh-git-sh
source ~/git-prompt.sh
# vi mode
# https://bbs.archlinux.org/viewtopic.php?id=95078
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        echo -ne "\033]12;deep sky blue\007"
    else
        echo -ne "\033]12;slate grey\007"
    fi
}
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    echo -ne "\033]12;slate grey\007"
}
zle -N zle-line-init
bindkey -v
# reduce delay after hitting <ESC>
export KEYTIMEOUT=1
PROMPT='%{$fg[yellow]%}%1~ %{$fg[magenta]%}❯%{$reset_color%} '
#PROMPT='
#%{$fg[green]%}%2~\
 #$(__posh_git_echo)
#%{$fg[magenta]%}❯%{$reset_color%} '
#RPROMPT='%(?,,%{$fg[red]%}[%?]%{$reset_color%})' # exit code
#RPROMPT='$(__posh_git_echo)'

# fancy ctrl-z
bindkey '^Z' fancy-ctrl-z

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use ;; as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER=';;'
# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'
# Use ag instead of the default find command for listing path candidates.
# - The first argument to the function is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# - ag only lists files, so we use with-dir script to augment the output
_fzf_compgen_path() {
  ag -g "" "$1" | with-dir "$1"
}
# Use ag to generate the list for directory completion
_fzf_compgen_dir() {
  ag -g "" "$1" | only-dir "$1"
}
export FZF_DEFAULT_OPTS='--height 70% --reverse'
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
# Directly executing the command (CTRL-X CTRL-R)
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

# completions
fpath=(~/completions $fpath)
autoload -Uz compinit && compinit -u

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# source ~/.rvm/scripts/rvm

# Set Options

# ===== Basics
setopt no_beep # don't beep on error
setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)

# ===== Changing Directories
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# ===== Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

# ===== History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt inc_append_history # Add commands as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt share_history # imports new commands and appends typed commands to history

# ===== Completion
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
unsetopt menu_complete # do not autoselect the first completion entry
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase
setopt complete_aliases

# ===== Correction
unsetopt correct # turn off spelling correction for commands

# ===== Scripts and Functions
setopt multios # perform implicit tees or cats when multiple redirections are attempted

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/rob/Dropbox/code/gopath/bin/gocomplete go

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/robphoenix/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/robphoenix/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/robphoenix/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/robphoenix/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
