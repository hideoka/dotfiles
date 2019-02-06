#!/usr/bin/env bash
set -Ceuo pipefail

[[ ! -d "$HOME/.config" || ! -d "$HOME/.config/alacritty" ]] && mkdir -p $HOME/.config/alacritty

for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue
  [[ $f == ".zsh" ]] && continue

  if [[ $f == ".vim" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/nvim
  elif [[ $f == ".alacritty.yml" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/alacritty/alacritty.yml
  else
    ln -snf $DOTFILE_PATH/$f ~/$f
  fi
done
