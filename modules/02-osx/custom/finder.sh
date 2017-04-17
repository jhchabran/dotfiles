#!/usr/bin/env bash
set -e

## Finder: Always open everything in Finder's list view. This is important.
## Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv', 'Nlsv'
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

## Finder: Show the ~/Library folder.
chflags nohidden ~/Library

## Finder: Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

## Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Finder: Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

## Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

## Finder: Allow text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

## Finder: When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Finder: new window location set to $HOME. Same as Finder > Preferences > New Finder Windows show
## For other path use "PfLo" and "file:///foo/bar/"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

## Finder: Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Finder: Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
