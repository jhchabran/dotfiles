#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
export DOTFILES_PATH=$HOME/perso/dotfiles
export PATH=$DOTFILES_PATH/bin:$PATH

for file in $DOTFILES_PATH/modules/*/install.sh; do
	echo "Installing module $file"
	bash $file
done

echo "Creating/Updating symlinks"
./update_symlinks.sh
