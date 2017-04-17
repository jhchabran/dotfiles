#!/usr/bin/env bash
set -e

## Disable press-and-hold for keys in favor of key repeat.
## By default OSX displays a menu when A,E,U,I,O,N keys are pressed and held.
defaults write -g ApplePressAndHoldEnabled -bool false

# Set key repeat rate 
# - Off: 300000
# - Slow: 120
# - Fast: (minimum 1)
defaults write NSGlobalDomain KeyRepeat -int 2

# Set delay until repeat (in milliseconds)
# Long: 120
# Short: 15
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Adjust keyboard brightness in low light
defaults write com.apple.BezelServices kDim -bool true
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool true

# Dim keyboard after idle time (in seconds)
defaults write com.apple.BezelServices kDimTime -int 300
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int 300

# Full Keyboard Access
# In windows and dialogs, press Tab to move keyboard focus between:
# 1 : Text boxes and lists only
# 3 : All controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use F1, F2, etc. keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false


# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

## Disable -- to be turned to — (emdash)
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

## Disable 'smart' quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

## Disable Auto-correct 
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## Disable auto capitalize
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

## Disable auto period insert
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
