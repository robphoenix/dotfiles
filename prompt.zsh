function insert-mode () {
    echo "
%{$fg[blue]%}%1~ \
$(__posh_git_echo) \
${${KEYMAP/vicmd/\$NORMAL_MODE}/(main|viins)/}
%{$fg[magenta]%}❯ %{$reset_color%}"
}

function normal-mode () {
    echo "
%{$fg[blue]%}%1~ \
$(__posh_git_echo) \
${${KEYMAP/vicmd/\$NORMAL_MODE}/(main|viins)/}
%{$fg[yellow]%}❯ %{$reset_color%}"
}

function set-prompt () {
    case ${KEYMAP} in
      (vicmd)      PS1="$(normal-mode)" ;;
      (main|viins) PS1="$(insert-mode)" ;;
      (*)          PS1="$(insert-mode)" ;;
    esac
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

local exit_code="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"
RPROMPT="$exit_code"

# posh git status info - https://github.com/lyze/posh-git-sh
# vi-mode indicator - https://unix.stackexchange.com/a/163645
#
# colours - black, red, green, yellow, blue, magenta, cyan, white.
