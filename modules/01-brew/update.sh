#!/usr/bin/env bash
set -e

announce "updating brew" 1
brew update > /dev/null

announce "packages to manually upgrade" 1
brew outdated

