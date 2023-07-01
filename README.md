# Arne's dotfiles

## Installation

1. Install `chezmoi`

2. Init chezmoi.

> chezmoi init git@github.com:arnewauters/dotfiles.git

### Font Symbols

> Do not use patched fonts! See Kitty pages. Instead:

1. Install `Symbols Nerd Font Mono` from the [Nerd Fonts Release Page](https://github.com/ryanoasis/nerd-fonts/releases).
2. Kitty should automatically pick up on it to use the symbols in LuaLin and NvimTree.

## General setup

`chezmoi` works by *syncing* the dotfiles repo with the actual files in the home
folder. It does not use symlinks.

## Basic operations

Adding files to manage with `chezmoi`:

> chezmoi add ~./<FILE>

Diffing to see what will be applied:

> chezmoi diff

Applying changes (verbose):

> chezmoi -v apply

Pulling and applying from dotfiles repo:

> chezmoi update -v

## Dotfiles notes

### ZSH

Using Oh My ZSH.

Paths, configs and autocompletion files are loaded in topics. See
   `dot_zshrc.tmpl`

Using `chezmoi` template functionality. Allows to load variables and have
conditional blocks.

Note that ZSH config is reloaded automatically using `run_after_reload.sh`.
