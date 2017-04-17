#!/usr/bin/env bash
set -e

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep off > /dev/null

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

