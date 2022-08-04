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

plugins=(ssh-agent z zsh-autosuggestions zsh-syntax-highlighting history-substring-search brew npm kubectl gitgo)

source $ZSH/oh-my-zsh.sh

# PROMPT
#
# git status
# https://github.com/lyze/posh-git-sh
source ~/git-prompt.sh
# reduce delay after hitting <ESC>
export KEYTIMEOUT=1
PROMPT='
%{$fg[cyan]%}%3~\
 $(__posh_git_echo)
%{$fg[magenta]%}❯%{$reset_color%} '
RPROMPT='%(?,,%{$fg[red]%}[%?]%{$reset_color%})' # exit code

# fancy ctrl-z
bindkey '^Z' fancy-ctrl-z

# completions
fpath=(~/completions $fpath)
autoload -Uz compinit && compinit -u

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.secrets.zsh ] && source ~/.secrets.zsh
