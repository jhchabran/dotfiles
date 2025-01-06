# https://sw.kovidgoyal.net/kitty/remote-control/
export KITTY_LISTEN_ON="unix:/tmp/mykitty"

# https://github.com/sumneko/lua-language-server
alias luamake=/Users/tech/code/src/github.com/sumneko/lua-language-server/3rd/luamake/luamake

if [ -d "/Applications/Emacs.app/Contents/MacOS/bin" ]; then
  export PATH="/Applications/Emacs.app/Contents/MacOS/bin:$PATH"
  alias emacs="emacs -nw" # Always launch "emacs" in terminal mode.
fi

eval "$(~/.local/bin/mise activate zsh)"

alias gr='go run ./...'
