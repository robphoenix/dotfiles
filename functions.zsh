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

# Run nvm logic when changing directories
function runNvmLogic() {
  # if no package.json, do nothing
  if [[ ! -f ./package.json ]]; then
    return
  fi

  # if no .nvmrc, use LTS
  if [[ ! -f ./.nvmrc ]]; then
    nvm use --lts
    return
  fi

  # if .nvmrc exists, check if the version is the same as the current node version
  # Note: Adding 'v' prefix if missing for comparison consistency
  local npm_version=$(node -v)
  local npmrc_version=$(cat ./.nvmrc | tr -d '\r')
  [[ "$npmrc_version" != v* ]] && npmrc_version="v$npmrc_version"

  # if the versions are different, use the version from the .nvmrc
  if [[ "$npm_version" != "$npmrc_version" ]]; then
    nvm use || { echo "Installing Node.js version from .nvmrc"; nvm install; }
  fi
}

# Register the hook
# This tells Zsh to run runNvmLogic every time the directory changes
autoload -U add-zsh-hook
add-zsh-hook chpwd runNvmLogic
