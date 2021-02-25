#!/usr/bin/env bash
set -e


name=$(cat computer_name)


# General Settings
## Set computer name.
sudo scutil --set ComputerName "$name"
sudo scutil --set HostName "$name.local"
sudo scutil --set LocalHostName "$name"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$name"
