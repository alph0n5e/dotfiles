# My Dotfiles

This repository stores a few of the tool configurations I frequently use and want to port from machine to machine.

It can be used with tools like [GNU Stow](https://www.gnu.org/software/stow/) to symlink configuration files to my home directory.

For example:
```
stow -t ~ zsh
```
will copy the content of the `zsh` directory in `~`.
