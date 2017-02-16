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

## exit code ################################################################

local exit_code="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"

## python virtualenv info ###################################################

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo " ("`basename $VIRTUAL_ENV`")"
}

## setup vi-mode indicator in prompt ########################################
#
# to have an indicator when in insert mode also, use:
# ${${KEYMAP/vicmd/\$NORMAL_MODE}/(main|viins)/\$INSERT_MODE}
# instead of:
# ${${KEYMAP/vicmd/\$NORMAL_MODE}/(main|viins)/}

function zle-line-init zle-keymap-select {
    NORMAL_MODE="%{$bg[blue]$fg[black]%} N %{$reset_color%}"
    INSERT_MODE="%{$bg[green]$fg[black]%} I %{$reset_color%}"
    PROMPT="
%{$fg[green]%}%~\
$(__posh_git_echo)\
%{$fg[magenta]%}\$(virtualenv_info) \
${${KEYMAP/vicmd/\$NORMAL_MODE}/(main|viins)/}
%{$fg[magenta]%}> \
%{$reset_color%}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

## right prompt #############################################################

RPROMPT="$exit_code"

#############################################################################
