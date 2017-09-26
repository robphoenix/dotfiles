# Personal aliases

# system
alias l="LC_COLLATE=C ls -lAhF -I.dropbox -I.dropbox.cache -I.cache -I__pycache__ -I.git -Inode_modules -I.vagrant -I.DS_Store --group-directories-first"
alias mv="mv -ivu"
alias cp="cp -ivu"
alias say="sudo apt -y"
alias sarepo="sudo add-apt-repository"
alias sudo="sudo "
alias su="sudo -i"
alias up="sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove"
alias rmd="sudo rm -r"
alias cpd="sudo cp -r"
alias bye="sudo shutdown now"
alias restart="sudo reboot now"
alias open="xdg-open"
alias gpg="gpg2"
alias music="cmus"
# wifi
alias lswifi="nmcli d wifi list"
# usb
alias u="usb"
alias uu="sudo umount /media/usb"
# start vpn
alias vpnu="sudo openvpn /etc/openvpn/pia-london.conf &"
alias vpnd="sudo killall openvpn"
# restic backup
alias backup="restic -r ~/Dropbox/agnesmartin/backup backup ~/Dropbox/code && restic -r ~/Dropbox/agnesmartin/backup backup ~/Dropbox/dotfiles && restic -r ~/Dropbox/agnesmartin/backup backup ~/Dropbox/sites"
# zsh
alias relo="source ~/.zshrc"
# tmux
alias tls="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
# ansible
alias apb="ansible-playbook"
# python
alias p="python3"
alias bpy="bpython"
alias pty="ptpython"
alias pyt="py.test"
alias mkv="mkvirtualenv -a ."
alias off="deactivate"
alias pi="sudo -H pip install -U"
alias pu="sudo -H pip uninstall"
# go
alias gg="go get -u -v"
alias gt="gotest"
alias gtv="gotest -v -cover"
alias gox="gox -output=\"bin/{{.Dir}}_{{.OS}}_{{.Arch}}\""
# git
alias git="hub"
alias g="git"
# exercism
alias exf="exercism fetch"
alias exs="exercism submit"
# vim/neovim
alias vi="nvim"
alias df="nvim ~/dotfiles"
alias factoryvim="vim -u ~/dotfiles/.vim/essential.vim"
# ranger
alias rng="ranger"
# cisco console connection
alias cscon="sudo screen /dev/ttyUSB0 9600"
# speedtest-cli
alias st="speedtest-cli"
# lua
alias lua="lua5.3"
# z
alias j=z
alias jj=zz
