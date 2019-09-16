# tree from @wesbos
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.cache|__pycache__|.git|node_modules|.vagrant|.DS_Store' --dirsfirst --filelimit 100 -L ${1:-3} -aC $2
}

# Fancy ctrl+z
# https://github.com/pjg/dotfiles/blob/master/.zshrc#L522-L533
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
