#!/bin/bash
set -e

announce "updating brew"
brew update

exec success "done"
