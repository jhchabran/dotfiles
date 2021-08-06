#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

if [[ ! -f "gitconfig.local.symlink" ]]; then
	echo "Please create gitconfig.local.symlink for the git module"
	exit 1
fi
