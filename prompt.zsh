#############################################################################
#
# 2016 Rob Phoenix @bordeltabernacle
# Heavily adapted from Yad Smood's ys.zsh-theme
#
## Makes use of #############################################################
#
#  - https://github.com/lyze/posh-git-sh
#       (posh git status info in prompt)
#  - https://github.com/zanshin/dotfiles/blob/master/zsh/prompt.zsh#L132
#       (indicates when in Normal mode)
#
## Colours ##################################################################
#
# black, red, green, yellow, *blue, magenta, cyan, and white.
# Modify the colors and symbols in these variables as desired.
#
## Prompt format ############################################################
#
# DIRECTORY [git:BRANCH STATE] (VIRTUALENV) VI-MODE
# > COMMAND                                             [LAST_EXIT_CODE]
#
# For example:
#
# python/diffios [master ≡ +0 ~1 -0] (diffios) N
# >                                                     [127]
#
#############################################################################

# Exit code
local exit_code="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"

# Python Virtualenv info
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo ' ('`basename $VIRTUAL_ENV`')'
}

# Setup Vi-mode indicator in prompt
# this will display two blue
function zle-line-init zle-keymap-select {
  VIM_PROMPT=" %{$bg[blue]%}%{$fg[black]%} N %{$reset_color%}"
  PS1="
%{$fg[green]%}%2~\
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
