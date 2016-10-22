# 2016 Rob Phoenix @bordeltabernacle
# Adapted from Yad Smood's ys.zsh-theme
#
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# Modify the colors and symbols in these variables as desired.

GIT_PROMPT_SUFFIX="%{$fg[yellow]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[cyan]%}↑NUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[red]%}↓NUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}!%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[red]%}±%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}✓%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {

  # Compose this value via multiple conditional appends.
  #local GIT_STATE="%{$fg[yellow]%}≡"
  local GIT_STATE=""

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
function git_prompt_info() {
  if [[ "$(parse_git_state)" == "" ]]; then
    local git_state="%{$fg[yellow]%} ≡]"
  else
    local git_state="$(parse_git_state)"
  fi
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "%{$fg[yellow]%}[${git_where#(refs/heads/|tags/)}%{$reset_color%}${git_state}"
}

local git_info='$(git_prompt_info)'

# Exit code
local exit_code="%(?,,%{$fg[red]%}%?%{$reset_color%})"

# Python Virtualenv info
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Setup Vi-mode indicator in prompt
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg[blue]%} ••%{$reset_color%}"
  PROMPT="
%{$fg[green]%}%~ \
${git_info}\
${${KEYMAP/vicmd/\$VIM_PROMPT}/(main|viins)/}
%{$fg[magenta]%}> \
%{$reset_color%}"
  zle reset-prompt
}

# Right Prompt
RPROMPT="%{$fg[magenta]%}\$(virtualenv_info) %{$reset_color%}$exit_code"

zle -N zle-line-init
zle -N zle-keymap-select
