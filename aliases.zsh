alias ls=ls
alias l="LC_COLLATE=C ls -lAhF"
alias mv="mv -iv"
alias cp="cp -iv"
alias sudo="sudo "
alias su="sudo -i"
alias rmd="sudo rm -r"
alias cpd="sudo cp -r"
alias p1="ping 1.1.1.1"
alias p8="ping 8.8.8.8"
# zsh
alias relo="source ~/.zshrc"
# go
alias gg="go get -u -v"
alias gt="gotest"
alias gtv="gotest -v -cover"
alias gox="gox -output=\"bin/{{.Dir}}_{{.OS}}_{{.Arch}}\""
# git
alias g="git"
# z
alias j=z
alias jj=zz
# yarn/npm
alias pd="install-peerdeps -Y"
alias ya="yarn add --ignore-optional"
alias yad="yarn add --ignore-optional --dev"
alias yr="yarn remove --ignore-optional"
alias ys="yarn start"
alias yu="yarn upgrade --ignore-optional"
alias yf="yarn format"
alias story="yarn storybook"
alias redep="rm -rf node_modules && yarn --ignore-optional"
# alias serve="npx http-server"
# k8s
alias k=kubectl
# VS Code
alias c="code"
alias oc="code ."


