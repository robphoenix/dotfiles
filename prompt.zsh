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
# black, red, green, yellow, blue, magenta, cyan, and white.
# Modify the colors and symbols in these variables as desired.
#
## Prompt format ############################################################
#
# DIRECTORY [git:BRANCH STATE] (VIRTUALENV) VI-MODE
# > COMMAND
#
# For example, with a modified file and stashes, in vi normal mode:
#
# ~/dotfiles [master ≡ +0 ~1 -0]* ◯
# >
#
# And, with a clean repo, in vi insert mode:
#
# ~/dotfiles [master ≡]
# >
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

function zle-line-init zle-keymap-select {
    NORMAL_MODE="%{$bg[black]$fg[white]%}◯ %{$reset_color%}"
    PROMPT="
%{$fg[white]%}%1~\
$(__posh_git_echo)\
%{$fg[magenta]%}\$(virtualenv_info) \
${${KEYMAP/vicmd/\$NORMAL_MODE}/(main|viins)/}
%{$fg[white]%}> \
%{$reset_color%}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

## right prompt #############################################################

RPROMPT="$exit_code"

#############################################################################
