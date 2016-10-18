# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood
# Adapted June 2016 Rob Phoenix

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} +"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ="

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Left Prompt: DIRECTORY BRANCH STATE
# Right Prompt: C:LAST_EXIT_CODE
#
# For example:
#
# ~/.oh-my-zsh master +
# ▶                                C:0
#
#
#REMOVED:
#[user@machine]
#%{$fg[yellow]%}%n%{$fg[cyan]%}@%{$fg[yellow]%}[%m] \

PROMPT="
%{$fg[green]%}%~ \
${git_info}
%{$fg[magenta]%}> \
%{$reset_color%}"

# Setup Vi-mode indicator in right-prompt
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[blue]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $exit_code"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
