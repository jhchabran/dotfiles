#!/usr/bin/env bash
set -e

# Always show scrollbars.
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

## Disable shutting down inactive applications
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

## Disable the "reopen windows when logging back in" option.
## This works, although the checkbox will still appear to be checked.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

## Disable reopen on restart
defaults write NSGlobalDomain ApplePersistence -bool false

## Disable App Nap
defaults write NSGlobalDomain NSAppSleepDisabled -bool YES

## Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Set the default icons in the Menu Bar
defaults write ~/Library/Preferences/com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Eject.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu"
