export GOPATH=$PROJECTS
export PATH="$GOPATH/bin:$PATH"
export GOBIN="$GOPATH/bin"
export GO111MODULE="on"

# Not the right place to put this, but it at least it works
source $HOME/.asdf/asdf.sh

# GOV=$(asdf current golang | sed 's/[[:space:]]*(set by .*)//g')
# export GOROOT=$HOME/.asdf/installs/golang/$GOV/go/
