#!/usr/bin/env bash
set -e

## Disable Shake to Find Cursor in OS X El Capitan for Mac
defaults write NSGlobalDomain CGDisableCursorLocationMagnification -bool true

# Increase Display contrast
defaults write com.apple.universalaccess increaseContrast -bool false

# Reduce Dislplay transparency
defaults write com.apple.universalaccess reduceTransparency -bool false
