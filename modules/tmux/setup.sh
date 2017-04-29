
#!/usr/bin/env bash
set -e

cd $(dirname $0)

if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  announce "tpm already exists. Updating ..." 1
  cd $HOME/.tmux/plugins/tpm && git pull > /dev/null && cd - > /dev/null
else
  announce "tpm missing. Closing ..." 1
  mkdir -p $HOME/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm > /dev/null
fi

