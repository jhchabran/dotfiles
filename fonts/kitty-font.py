#!/usr/bin/env python3

import subprocess
import re
import os
import sys
from os.path import expanduser

excluded = ["Apple Braille", "Apple Color Emoji", "Courier", "Courier New"]
font_cfg_path = expanduser("~") + '/.config/kitty/font.conf'
direction = -1 if len(sys.argv) > 1 and sys.argv[1] == "prev" else 1

def run(command):
    args = command.split(" ")
    return subprocess.run(args, stdout=subprocess.PIPE).stdout.decode("utf-8")

def current_font():
    with open(font_cfg_path) as reader:
        line = reader.readline()
        return re.sub('font_family ', '', line).strip()

current = current_font()

# Get the available fonts from the OS
res = run("kitty list-fonts")
fonts = [s for s in res.split("\n") if s.find("    ") == -1 and len(s) > 0 and s not in excluded]

# Locate the index of the current one
try:
    idx = fonts.index(current)
except ValueError:
    idx = 0

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
