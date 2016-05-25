#!/bin/bash

# This is the beginning attempt to script a linux laptop setup, 
# basically ripped off from the inimitable Jessie Frazelle 
# https://github.com/jfrazelle/dotfiles/blob/master/bin/install.sh

# get the user that is not root
# TODO: makes a pretty bad assumption that there is only one other user
USERNAME=$(find /home/* -maxdepth 0 -printf "%f" -type d)

# sets up apt sources
# assumes you are going to use debian stretch
setup_sources() {
	apt-get update
	apt-get install -y \
		apt-transport-https \
		--no-install-recommends

	cat <<-EOF > /etc/apt/sources.list
	deb http://httpredir.debian.org/debian stretch main contrib non-free
	deb-src http://httpredir.debian.org/debian/ stretch main contrib non-free
	deb http://httpredir.debian.org/debian/ stretch-updates main contrib non-free
	deb-src http://httpredir.debian.org/debian/ stretch-updates main contrib non-free
	deb http://security.debian.org/ stretch/updates main contrib non-free
	deb-src http://security.debian.org/ stretch/updates main contrib non-free
	#deb http://httpredir.debian.org/debian/ jessie-backports main contrib non-free
	#deb-src http://httpredir.debian.org/debian/ jessie-backports main contrib non-free
	deb http://httpredir.debian.org/debian experimental main contrib non-free
	deb-src http://httpredir.debian.org/debian experimental main contrib non-free
	# hack for latest git (don't judge)
	deb http://ppa.launchpad.net/git-core/ppa/ubuntu wily main
	deb-src http://ppa.launchpad.net/git-core/ppa/ubuntu wily main
	# neovim
	deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu wily main
	deb-src http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu wily main
	# tlp: Advanced Linux Power Management
	# http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html
	deb http://repo.linrunner.de/debian sid main
	EOF

	# add docker apt repo
	cat <<-EOF > /etc/apt/sources.list.d/docker.list
	deb https://apt.dockerproject.org/repo debian-stretch main
	deb https://apt.dockerproject.org/repo debian-stretch testing
	deb https://apt.dockerproject.org/repo debian-stretch experimental
	EOF

	# add docker gpg key
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

	# add the git-core ppa gpg key
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24

	# add the neovim ppa gpg key
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 9DBB0BE9366964F134855E2255F96FCF8231B6DD

	# add the tlp apt-repo gpg key
	apt-key adv --keyserver pool.sks-keyservers.net --recv-keys CD4E8809

	# turn off translations, speed up apt-get update
	mkdir -p /etc/apt/apt.conf.d
	echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/99translations
}

# setup /etc/apt/sources.list
setup_sources

apt-get update
apt-get -y upgrade

apt-get install -y \
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
