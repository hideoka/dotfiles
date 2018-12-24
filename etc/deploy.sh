#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

[[ ! -d "$HOME/.config" || ! -d "$HOME/.config/alacritty" ]] && mkdir -p $HOME/.config/alacritty

for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue
  [[ $f == ".zsh" ]] && continue

  if [[ $f == ".vim" ]]; then
    ln -snf $HOME/dotfiles/$f/nvim ~/.config/nvim
  elif [[ $f == ".alacritty.yml" ]]; then
    ln -snf $HOME/dotfiles/$f ~/.config/alacritty/alacritty.yml
  else
    ln -snf $HOME/dotfiles/$f ~/$f
  fi
done
