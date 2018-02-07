# Personal aliases

# system
alias ls=ls
alias l="LC_COLLATE=C ls -lAhF -I.dropbox -I.dropbox.cache -I.cache -I__pycache__ -I.git -Inode_modules -I.vagrant -I.DS_Store"
alias mv="mv -ivu"
alias cp="cp -ivu"
alias say="sudo apt -y"
alias sarepo="sudo add-apt-repository"
alias sudo="sudo "
alias su="sudo -i"
alias up="sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove"
alias rmd="sudo rm -r"
alias cpd="sudo cp -r"
alias off="sudo shutdown now"
alias restart="sudo reboot now"
alias open="xdg-open"
alias gpg="gpg2"
alias music="cmus"
# zsh
alias relo="source ~/.zshrc"
# tmux
alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
# go
alias gg="go get -u -v"
alias gt="gotest"
alias gtv="gotest -v -cover"
alias gox="gox -output=\"bin/{{.Dir}}_{{.OS}}_{{.Arch}}\""
# git
alias g="git"
# exercism
alias exf="exercism fetch"
alias exs="exercism submit"
# z
alias j=z
alias jj=zz
