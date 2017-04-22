#!/usr/bin/env bash
set -e

cd $(dirname $0)

if [ -d "$HOME/.config/nvim" ]; then
  announce "nvim configuration already exists. Updating ..." 1
  cd $HOME/.config/nvim && git pull > /dev/null && cd - > /dev/null
else
  announce "nvim configuration missing. Closing ..." 1
  git https://github.com/heetch/neovim-config.git $HOME/.config/nvim > /dev/null
fi

if [ -L "$HOME/.config/nvim/private.vim" ]; then
  announce "private.vim file already exists. Skipping" 1
elif [ -f "$HOME/.config/nvim/private.vim" ]; then
  announce "$HOME/.config/nvim/private.vim already exists. Please delete it. Skipping" 1
else
  announce "private.vim file missing. Symlinking..." 1
  ln -s $(pwd)/private.vim $HOME/.config/nvim/private.vim
fi


announce "installing/updating Plug" 1
nvim -c ":PlugInstall" -c ":PlugUpdate" -c ":qa"

