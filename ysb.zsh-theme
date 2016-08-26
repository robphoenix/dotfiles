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

# Prompt format:
#
# DIRECTORY BRANCH STATE TIME C:LAST_EXIT_CODE
# PRIVILEGES COMMAND
#
# For example:
#
# ~/.oh-my-zsh master x 11:09 C:0
# %
#

PROMPT="
%{$fg[cyan]%}[%n@%m] \
%{$fg[green]%}%~\
${git_info} \
$exit_code
%{$fg[magenta]%}▶ \
%{$reset_color%}"

RPROMPT=""
