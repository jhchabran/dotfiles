#!/usr/bin/env bash

set -e

function require {
	local package="$1"

	if [ $(dpkg-query -W -f='${Status}' ${package} 2>/dev/null | grep -c "ok installed") -eq 0 ] 
	then
		sudo apt-get -y install $package
	else
		echo "Skipping $package, already installed."
	fi
} 

echo "Checking for base dependencies" 

require realpath
require bash-completion
require build-essential
require python-software-properties
require software-properties-common
require vim-nox
require git-core
require curl
require zlib1g-dev
require libssl-dev
require libreadline-dev
require libyaml-dev
require libsqlite3-dev
require sqlite3
require libxml2-dev
require libxslt1-dev
require libcurl4-openssl-dev
require exuberant-ctags
require imagemagick
require libmagickwand-dev

echo "Copying dotfiles" 

for file in config/* 
do
	if [ -f ~/$(basename $file) ] || [ -L ~/$(basename $file) ]
	then
		echo "$(basename $file) exists, moving it to $(basename $file).old"
		mv ~/$(basename $file) ~/$(basename $file).old
	fi

	echo "Linking $(realpath $file) to ~/.$(basename $file)"
	ln -s -i $(realpath $file) ~/.$(basename $file)
done

echo "Setuping Vim"

mkdir -p  ~/.vim/bundle

if [ ! -f ~/.vim/bundle/neobundle.vim ]
then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
  echo "Skipping neobundle, already installed."
fi

echo "Installing Ruby"

if [ ! -d ~/.rbenv ]
then
	echo "Installing rb-env"
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
else
	echo "Skipping rbenv, already installed."
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ ! -d ~/.rbenv/plugins/ruby-build ]
then
	echo "Installing ruby-build"
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
else
	echo "Skipping ruby-build, already installed."
fi

rbenv install 1.9.3-p547 || true
rbenv install 2.1.2 || true

rbenv global 2.1.2

echo "Installing common gems" 

gem install bundler
gem install foreman
gem install CoffeeTags
gem install pry

echo "Installing Java 7" 

sudo add-apt-repository ppa:webupd8team/java
require oracle-java7-installer
require oracle-java7-set-default

echo "Installing Clojure" 
echo "Installing leiningen"

if [ ! -f ~/.bin/lein ]
then
	mkdir -p ~/.bin
	pushd .
	cd ~/.bin
	wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
	chmod +x lein
	popd
else
	echo "Skipping leiningen script, already installed"
fi

~/.bin/lein deps

echo "Installing NodeJS"

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
require nodejs
require npm


echo "Setuping projects structure"

if [ ! -d ~/code ]
then
  mkdir -p ~/code/opensource
fi
