# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood
# Adapted June 2016 Rob Phoenix

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
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
#%{$fg[cyan]%}[%n@%m] \

PROMPT="\
%{$fg[green]%}%~\
${git_info}
%{$fg[magenta]%}▶ \
%{$reset_color%}"

RPROMPT="$exit_code"

