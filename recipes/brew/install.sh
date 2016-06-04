#!/bin/sh

#
# Homebrew
#
# This installs/updates homebrew
set -e

HOMEBREW_PREFIX="/usr/local"

announce "brew"
announce "checking installation" 1

if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

if ! command -v brew >/dev/null; then
  announce "installing" 1
  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if brew list | grep -Fq brew-cask; then
  announce "uninstalling old Homebrew-Cask" 1
  brew uninstall --force brew-cask
fi

announce "installation completed" 1
exec success "done"

