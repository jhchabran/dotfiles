#!/usr/bin/env bash

set -e

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

echo "Copying dotfiles" 

for file in config/* 
do
  if [ -f ~/$(basename $file) ] || [ -d ~/$(basename $file) ] || [ -L ~/$(basename $file) ]
	then
		echo "$(basename $file) exists, moving it to $(basename $file).old"
		mv ~/$(basename $file) ~/$(basename $file).old
	fi

	echo "Linking $(realpath $file) to ~/.$(basename $file)"
	ln -s -i $(realpath $file) ~/.$(basename $file)
done

echo "Setuping Vim"

if [ ! -d ~/.nvim ] || [ ! -d ~/.nvim/bundle ]
then
  mkdir -p  ~/.nvim/bundle
fi

if [ ! -d ~/.nvim/bundle/neobundle.vim ]
then
  git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim
else
  echo "Skipping neobundle, already installed."
fi

