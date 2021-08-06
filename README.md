# Dotfiles

Those are my dotfiles and are meant to be used on a macOS computer.

Everything is splitted in modules making the maintainance and the evolutions easy.

I keep my vimrc because it's useful from time to time, but these days I use emacs, see https://github.com/jhchabran/doom.d for more.

## Install

Clone this repository to ~/.dotfiles

```
git clone git@github.com:jhchabran/dotfiles.git ~/.dotfiles
```


Then install the dotfiles:
```
~/.dotfiles/setup.sh
```

The script will ask for information regarding Git configuration(name, email), computer name as well as sudo password.

And from time to time, feel free to run the following command to keep your system up-to-date(OSX, Brew, and dotfiles).

```
dotfiles-update
```

### Dependencies

- https://github.com/dandavison/delta

## Licence

It is free software, and may be redistributed under the terms specified in the [LICENSE](./LICENCE) file.

