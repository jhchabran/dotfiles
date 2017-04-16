#/bin/bash

announce "creating $HOME/.bin directory"
mkdir -p "$HOME/.bin"

announce "creating $HOME/Code directory"
mkdir -p "$HOME/Code"

announce "registering new zsh shell"
grep "/usr/local/bin/zsh" /etc/shells > /dev/null || command -v zsh | sudo tee -a /etc/shells

announce "updating shell to ZSH"
chsh -s "$(which zsh)"
