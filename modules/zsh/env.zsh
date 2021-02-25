export EDITOR='emacsclient -nw'

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Enable SSH-Agent
eval "$(ssh-agent -s > /dev/null)"

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# export TERM=xterm-24bit

export LC_ALL=en_US.UTF-8
export GIT_GET_PATH=$PROJECTS/src
