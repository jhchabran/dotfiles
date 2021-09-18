# Dotfiles

Those are my dotfiles and are meant to be used on a macOS computer.
Everything is splitted in modules making the maintainance and the evolutions easy.

:bulb: If you're looking for my vimfiles, they're in another repository: https://github.com/jhchabran/nvim-config

## A brief interlude about workflow

Dotfiles, often are a pile of configuration snippets on top of each others and a courageous person can sometimes find 
useful ideas to port in their own config. While I think that's pretty neat in itself, I feel like half of the value is being
left out because it's really hard to grasp the author workflow without some high-level description. 

So at the bottom of this README, I describe how I do things. I hope that I'll remember to update it as my workflow change :muscle:

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

## Workflow

A typical session looks like the following: 

1. `j PROJECT-NAME`, where `PROJECT-NAME` is often shortened and mistyped. It's like a better `cd` that remembers folders that you often use.
2. `vi`, which will launch _neovim_ in the project root. It'll restore the previous session (opened files and buffers) automatically.
3. open another terminal within _neovim_ when needed

Sometimes I'll need to deal with some state on the system:

- `kill **` and then pressing TAB will open up _FZF_ and fuzzy find through the process list.
- `who-listens 8080` will tell me which process is listening on 8080. 

Frequently, I'm searching for something:

- `rg ...` for plain-text searches
- LSP symbols fuzzy search, within _neovim_, when searching for a function or a type name

When it comes to git, it's pretty vanilla:
- straight `git` commands, aliasing only confuses me, I never seem to remember them. 
- _delta_ to provide more readable diffs, and I really like the side by side view.
- half the time, git commands are performed within the editor, with plugins.

Multitasking: 

- _kitty_ provides tabs and splits, which is largely enough for me. 
  - I have been a heavy _tmux_ user for years but I don't use it anymore, it always felt like a broken abstraction.
- I use _magnet_ to provide a kind-of tiling WM experience, it's largely enough.

## Licence

It is free software, and may be redistributed under the terms specified in the [LICENSE](./LICENCE) file.

