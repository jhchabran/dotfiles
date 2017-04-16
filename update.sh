#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
export DOTFILES_PATH=$HOME/.dotfiles
export PATH=$DOTFILES_PATH/bin:$PATH

find $DOTFILES_PATH/recipes -name update.sh | while read file; do announce "$file"; bash $file ; done
