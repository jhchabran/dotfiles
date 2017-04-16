#!/bin/bash
set -e

announce "restoring vscode settings"

mkdir -p ~/Library/Application Support/Code/User
ln -sf $DOTFILES_PATH/recipes/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

exec success "done"
