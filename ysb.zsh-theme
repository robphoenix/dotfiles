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
local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Python Virtualenv info
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

local venv="$(virtualenv_info)"

# Left Prompt
PROMPT="
%{$fg[magenta]%}\$(virtualenv_info)\
%{$fg[green]%}%~ \
$(git_prompt_info)
%{$fg[magenta]%}> \
%{$reset_color%}"

# Right Prompt
# Setup Vi-mode indicator in right-prompt
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[blue]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $exit_code"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
