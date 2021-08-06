#!/usr/bin/env bash
set -e

cd "$(dirname $0)"

if [[ ! -f "kitty.symlink/font.conf" ]]; then
  echo "font_family Menlo Regular" > kitty.symlink/font.conf
fi
