#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

cd "$(dirname $0)"

export DOTFILES_PATH=$HOME/.dotfiles

echo "› set default OSX values"
$DOTFILES_PATH/recipes/osx/set-defaults.sh

echo "› update OSX"
$DOTFILES_PATH/recipes/osx/install-updates.sh

echo "› install/update homebrew"
$DOTFILES_PATH/recipes/homebrew/install.sh 2>&1

echo "› creating $HOME/.bin directory"
mkdir -p "$HOME/.bin"

echo "› creating $HOME/Code directory"
mkdir -p "$HOME/Code"

echo "› brew bundle"
brew bundle

echo "› registering new zsh shell..."
grep "/usr/local/bin/zsh" /etc/shells > /dev/null || command -v zsh | sudo tee -a /etc/shells

echo "› updating shell to ZSH"
chsh -s "$(which zsh)"

# find the installers and run them iteratively
find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
