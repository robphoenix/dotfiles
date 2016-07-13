# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood
# Adapted June 2016 Rob Phoenix

# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[yellow]%} (%{$fg[cyan]%}"
YS_VCS_PROMPT_PREFIX2="%{$fg[yellow]%}:%{$fg[green]%}"
YS_VCS_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# DIRECTORY > git:BRANCH STATE C:LAST_EXIT_CODE
# > COMMAND
#
# For example:
#
# ~/.oh-my-zsh > git:master x C:0
# >

PROMPT="
 %(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[yellow]%}{%{$fg[cyan]%}%n)\
%{$fg[yellow]%}:\
%{$fg[green]%}%m%{$fg[yellow]%}}\
${git_info} \
%{$fg[cyan]%}%~%{$reset_color%}\
 $exit_code
%{$fg[magenta]%} > %{$reset_color%}"
