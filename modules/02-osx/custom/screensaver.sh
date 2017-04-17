#!/usr/bin/env bash
set -e

## Disable screensaver
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Show with clock
defaults -currentHost write com.apple.screensaver showClock -bool false
