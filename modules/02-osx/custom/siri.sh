#!/usr/bin/env bash
set -e

# Disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false 

# Language
defaults write com.apple.assistant.backedup "Session Language" -string "en-US"

# Show Siri in menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false

# Voice Feedback
# 2 : On
# 3 : Off
defaults write com.apple.assistant.backedup "Use device speaker for TTS" -int 3

