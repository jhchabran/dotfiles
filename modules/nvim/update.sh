#!/usr/bin/env bash
set -e

cd $(dirname $0)

if [ -d "$HOME/.config/nvim" ]; then
  announce "nvim configuration already exists. Updating ..." 1
  cd $HOME/.config/nvim && git pull > /dev/null && cd - > /dev/null
else
  announce "nvim configuration missing. Please install dotfiles first" 1
  exit 1
fi

announce "installing/updating Plug" 1
nvim -c ":PlugInstall" -c ":PlugUpdate" -c ":qa"


