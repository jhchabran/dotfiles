#!/usr/bin/env python3

import subprocess
import re
import os
import sys
from os.path import expanduser

font_cfg_path = expanduser("~") + '/.config/kitty/font.conf'
direction = -1 if len(sys.argv) > 1 and sys.argv[1] == "prev" else 1

def run(command):
    args = command.split(" ")
    return subprocess.run(args, stdout=subprocess.PIPE).stdout.decode("utf-8")

def current_font():
    with open(font_cfg_path) as reader:
        line = reader.readline()
        return re.sub('font_family ', '', line).strip()


# Get the current font
current = current_font()

# Get the available fonts from the OS
res = run("fc-list : family")

# Keep only nerd fonts
fonts = [s for s in res.split("\n") if s.find("Nerd") > 0]

# Locate the index of the current one
idx = fonts.index(current)

# Set the next font as the current one
with open(font_cfg_path, 'w') as f:
    i = (idx + direction) % len(fonts)
    print('switching to ' + fonts[i])
    f.write('font_family ' + fonts[i])

# Run some apple script to tell kitty to reload the config
script = """
osascript <<EOF
activate application "kitty"
tell application "System Events" to keystroke "," using {control down, command down}
EOF
"""
os.system(script)
