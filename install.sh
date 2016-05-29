#!/bin/bash

# This is the beginning attempt to script a linux laptop setup, 
# basically ripped off from the inimitable Jessie Frazelle 
# https://github.com/jfrazelle/dotfiles/blob/master/bin/install.sh

# get the user that is not root
# TODO: makes a pretty bad assumption that there is only one other user
USERNAME=$(find /home/* -maxdepth 0 -printf "%f" -type d)

# turn off translations, speed up apt-get update
mkdir -p /etc/apt/apt.conf.d
echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations

apt-get update
apt-get -y upgrade

apt-get install -y \
	apt-transport-https
	git \
        neovim \
        sudo \
        i3 \
        bash-completion \
        --no-install-recommends

apt-get install -y tlp tlp-rdw

apt-get autoremove
apt-get autoclean
apt-get clean

adduser "$USERNAME" sudo
