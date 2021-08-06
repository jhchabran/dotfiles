#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"
export DOTFILES_PATH=$HOME/.dotfiles
export PATH=$DOTFILES_PATH/bin:$PATH

for file in $DOTFILES_PATH/modules/*/update.sh; do
	announce "Updating module $file"
	bash $file
done
