function zle-line-init zle-keymap-select {
    DIR_DEPTH="1"
    CWD="%{$fg[blue]%}%$DIR_DEPTH~"
    NORMAL_MODE="$fg[blue]%}❯"
    INSERT_MODE="%{$fg[magenta]%}❯"
    VI_MODE="${${KEYMAP/vicmd/$NORMAL_MODE}/(main|viins)/$INSERT_MODE}%{$reset_color%} "
    PS1="
$CWD \
$(__posh_git_echo)
$VI_MODE\
"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

local EXIT_CODE="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"
RPROMPT="$EXIT_CODE"

# posh git status info - https://github.com/lyze/posh-git-sh
# vi-mode indicator - https://stackoverflow.com/a/3791786
#
# colours - black, red, green, yellow, blue, magenta, cyan, white.
