# https://github.com/icholy/git-get
export GIT_GET_PATH=$PROJECTS/src

# https://sw.kovidgoyal.net/kitty/remote-control/
export KITTY_LISTEN_ON="unix:/tmp/mykitty"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://github.com/sumneko/lua-language-server
alias luamake=/Users/tech/code/src/github.com/sumneko/lua-language-server/3rd/luamake/luamake

# http://asdf-vm.com
. $(brew --prefix asdf)/asdf.sh

# I always run PG in a container
export PG_HOST=localhost
