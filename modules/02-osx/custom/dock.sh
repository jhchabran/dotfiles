#!/usr/bin/env bash
set -e

## Dock: Icon size of Dock items
defaults write com.apple.dock tilesize -int 46

## Dock: Don't use tabs in Finder
defaults write com.apple.finder AppleWindowTabbingMode -string "manual"

## Dock: Lock the Dock size
defaults write com.apple.dock size-immutable -bool true

## Dock: Dock magnification
defaults write com.apple.dock magnification -bool true

## Dock: Icon size of magnified Dock items
defaults write com.apple.dock largesize -int 64

## Dock: Minimization effect: 'genie', 'scale', 'suck'
defaults write com.apple.dock mineffect -string 'scale'

## Dock: Minimize to application
defaults write com.apple.dock minimize-to-application -bool true

## Dock: Dock orientation: 'left', 'bottom', 'right', 'bottom'
defaults write com.apple.dock 'orientation' -string 'bottom'

## Dock: Dock pinning: 'start', 'middle', 'end'
defaults write com.apple.dock pinning -string 'middle'

## Dock: Lock the Dock position
defaults write com.apple.dock position-immutable -bool true

## Dock: Double-click a window's title bar to: None, Mimimize, Maximize (zoom)
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "None"

## Dock: Animate opening applications
defaults write com.apple.dock launchanim -bool false

## Dock: Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

## Dock: Auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Dock setup
if which dockutil > /dev/null; then
  dockutil --remove all

  dockutil --add "/Applications/Launchpad.app"
  dockutil --add "/Applications/Franz.app"
  dockutil --add "/Applications/Slack.app"
  dockutil --add "/Applications/Google Chrome.app"
  dockutil --add "/Applications/iTerm.app"
  dockutil --add "/Applications/Pocket.app"
  dockutil --add "/Applications/Spotify.app"
else
  echo "dockutil not installed"
fi