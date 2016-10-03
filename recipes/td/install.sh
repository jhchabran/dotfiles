#!/bin/sh
set -e

announce "installing td"

go get -u github.com/Swatto/td

exec success "done"
