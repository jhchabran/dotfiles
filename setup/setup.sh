#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

cd "$(dirname $0)"

export DOTFILES_PATH=$HOME/.dotfiles

export PATH=$DOTFILES_PATH/setup/bin:$PATH


$DOTFILES_PATH/recipes/osx/set-defaults.sh


#$DOTFILES_PATH/recipes/osx/install-updates.sh

$DOTFILES_PATH/recipes/brew/install.sh 2>&1

announce "creating $HOME/.bin directory"
mkdir -p "$HOME/.bin"

announce "creating $HOME/Code directory"
mkdir -p "$HOME/Code"

announce "brew bundle"
brew bundle

announce "registering new zsh shell"
grep "/usr/local/bin/zsh" /etc/shells > /dev/null || command -v zsh | sudo tee -a /etc/shells

announce "updating shell to ZSH"
# chsh -s "$(which zsh)"

# find the installers and run them iteratively
find $DOTFILES_PATH/recipes -name install.sh | while read installer ; do sh -c "${installer}" ; done

./update-dotfiles.sh
