# Fonts

`kitty-font.py` allows to change the current font used by [kitty](https://sw.kovidgoyal.net/kitty/). It only works on OSX.

Because there is, AFAIK, no direct way to achieve that, the script is a mix of python and apple script. Yup, ductape all the way 😆 !

## Installation

### Fonts 

The script only selects nerd fonts, because that's what I use. As such at least two must be installed for the script to work. 
See my [Brewfile](./Brewfile) for a list of those fonts. These can be installed by running `brew bundle install` in this directory.

### Setup

In order to work, the script requires a specific config file for the kitty font to be present: 

```
$ cat ~/.config/kitty/font.conf 
font_family InconsolataGo Nerd Font%
```

That config must be included from the main kitty configuration: 

```
$ cat ~/.config/kitty/kitty.conf 
include font.conf # <---- the mandatory include statement
bold auto
italic_font auto
bold_italic_font auto

# (...)

map cmd+y launch --copy-env ~/.dotfiles/fonts/kitty-font.py
map cmd+u launch --copy-env ~/.dotfiles/fonts/kitty-font.py prev
```

## Running

Simply calling `kitty-font.py` or `kitty-font.py prev` will: 

1. List all Nerd fonts known to the OS
2. Find the next one in the above list of fonts, based on the current one.
3. Edit the font configuration file (`font.conf` in the kitty config directory)
4. Run some apple script that will tell kitty to reload its configuration.

### Useful bindings

Adding some mappings to the kitty configuration make the whole process really easy: 

```
map cmd+y launch --copy-env ~/.dotfiles/fonts/kitty-font.py
map cmd+u launch --copy-env ~/.dotfiles/fonts/kitty-font.py prev
```
