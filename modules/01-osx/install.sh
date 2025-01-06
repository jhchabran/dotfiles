#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

#if ! [ -f "computer_name" ]; then
#	announce "How to you want to name your computer?" 1
#	read -e computer_name
#	echo $computer_name > computer_name
#else
#	computer_name_file="computer_name"
#	computer_name=$(cat $computer_name_file)
#	announce "Computer name is already set to '$computer_name'. To reset it delete $(pwd)/$computer_name_file" 1
# fi

announce "Creating $HOME/.bin directory" 1
mkdir -p "$HOME/.bin"

announce "Creating $HOME/code directory" 1
mkdir -p "$HOME/work"

announce "Registering new zsh shell" 1
grep "/usr/local/bin/zsh" /etc/shells > /dev/null || command -v zsh | sudo tee -a /etc/shells

announce "Updating shell to ZSH" 1
chsh -s "$(which zsh)"
