export ZSH=$HOME/.oh-my-zsh

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(z thefuck virtualenvwrapper ssh-agent gpg-agent zsh-syntax-highlighting colored-man-pages tmuxinator)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/git-prompt.sh
source ~/prompt.zsh

# disable virtualenvwrapper prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# solarized dir colours
eval `dircolors ~/.dircolors`

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# vi mode in the terminal
bindkey -v

# fancy ctrl-z
bindkey '^Z' fancy-ctrl-z

# Base16 colour schemes
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# ZSH history substring search
source $HOME/dotfiles/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# autocomplete
fpath=(~/.zsh/completions /home/rob/.oh-my-zsh/plugins/colored-man-pages /home/rob/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting /home/rob/.oh-my-zsh/plugins/gpg-agent /home/rob/.oh-my-zsh/plugins/ssh-agent /home/rob/.oh-my-zsh/plugins/virtualenvwrapper /home/rob/.oh-my-zsh/plugins/thefuck /home/rob/.oh-my-zsh/plugins/z /home/rob/.oh-my-zsh/functions /home/rob/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/share/zsh/vendor-functions /usr/share/zsh/vendor-completions /usr/share/zsh/functions/Calendar /usr/share/zsh/functions/Chpwd /usr/share/zsh/functions/Completion /usr/share/zsh/functions/Completion/AIX /usr/share/zsh/functions/Completion/BSD /usr/share/zsh/functions/Completion/Base /usr/share/zsh/functions/Completion/Cygwin /usr/share/zsh/functions/Completion/Darwin /usr/share/zsh/functions/Completion/Debian /usr/share/zsh/functions/Completion/Linux /usr/share/zsh/functions/Completion/Mandriva /usr/share/zsh/functions/Completion/Redhat /usr/share/zsh/functions/Completion/Solaris /usr/share/zsh/functions/Completion/Unix /usr/share/zsh/functions/Completion/X /usr/share/zsh/functions/Completion/Zsh /usr/share/zsh/functions/Completion/openSUSE /usr/share/zsh/functions/Exceptions /usr/share/zsh/functions/MIME /usr/share/zsh/functions/Misc /usr/share/zsh/functions/Newuser /usr/share/zsh/functions/Prompts /usr/share/zsh/functions/TCP /usr/share/zsh/functions/VCS_Info /usr/share/zsh/functions/VCS_Info/Backends /usr/share/zsh/functions/Zftp /usr/share/zsh/functions/Zle)
autoload -U compinit && compinit

# tmuxinator
source ~/dotfiles/tmuxinator.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source ~/.rvm/scripts/rvm

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
