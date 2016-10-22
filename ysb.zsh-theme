# 2016 Rob Phoenix @bordeltabernacle
# Adapted from Yad Smood's ys.zsh-theme
#
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ±"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ="

# Exit code
local exit_code="%(?,,%{$fg[red]%}%?%{$reset_color%})"

# Python Virtualenv info
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Setup Vi-mode indicator in prompt
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[blue]%} [N]%{$reset_color%}"
  PROMPT="
%{$fg[magenta]%}\$(virtualenv_info)\
%{$fg[green]%}%~ \
${git_info}\
${${KEYMAP/vicmd/\$VIM_PROMPT}/(main|viins)/}
%{$fg[magenta]%}> \
%{$reset_color%}"
  zle reset-prompt
}

RPROMPT="$exit_code"

zle -N zle-line-init
zle -N zle-keymap-select
