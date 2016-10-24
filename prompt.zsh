# 2016 Rob Phoenix @bordeltabernacle
# Adapted from Yad Smood's ys.zsh-theme
# Makes use of https://github.com/lyze/posh-git-sh
#
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# Modify the colors and symbols in these variables as desired.

# Exit code
local exit_code="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"

# Python Virtualenv info
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo ' ('`basename $VIRTUAL_ENV`')'
}

# Setup Vi-mode indicator in prompt
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[blue]%} ••%{$reset_color%}"
  PS1="
%{$fg[green]%}%~\
$(__posh_git_echo)\
%{$fg[magenta]%}\$(virtualenv_info)\
${${KEYMAP/vicmd/\$VIM_PROMPT}/(main|viins)/}
%{$fg[magenta]%}> \
%{$reset_color%}"
  zle reset-prompt
}

# Right Prompt
RPS1="$exit_code"

zle -N zle-line-init
zle -N zle-keymap-select
