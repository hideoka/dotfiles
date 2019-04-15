#!/usr/bin/env bash
set -Ceuo pipefail

mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/pgcli

for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue
  [[ $f == ".zsh" ]] && continue

  if [[ $f == ".vim" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/nvim
  elif [[ $f == ".alacritty.yml" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/alacritty/alacritty.yml
  elif [[ $f == ".pgclirc" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/pgcli/config
  else
    ln -snf $DOTFILE_PATH/$f ~/$f
  fi
done
