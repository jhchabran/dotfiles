#!/bin/sh

#
# Homebrew
#
# This installs/updates homebrew

HOMEBREW_PREFIX="/usr/local"

echo "› brew checking installation"

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
  echo "› brew installing"
  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if brew list | grep -Fq brew-cask; then
  echo "› brew uninstalling old Homebrew-Cask"
  brew uninstall --force brew-cask
fi

echo "› brew installation completed"

exit 0
