#!/bin/bash 
set -e

cd "$(dirname $0)"

if [[ ! -f "computername" ]]; then
	echo "Please create a computername file containing the name of your computer in the osx module."
	exit 1	
fi

killall "System Preferences" 2>/dev/null || true

for file in custom/*.sh; do
	announce "Applying $file" 1
	bash $file
done

announce "Creating $HOME/.bin directory" 1
mkdir -p "$HOME/.bin"

announce "Creating $HOME/Code directory" 1
mkdir -p "$HOME/Code"

announce "Registering new zsh shell" 1
grep "/usr/local/bin/zsh" /etc/shells > /dev/null || command -v zsh | sudo tee -a /etc/shells

announce "Updating shell to ZSH" 1
chsh -s "$(which zsh)"
