#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd "$(dirname "$0")" && pwd)

mkdir -p "$HOME"/.config/alacritty
mkdir -p "$HOME"/.config/sheldon
mkdir -p "$HOME"/.config/rtx

for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue
  [[ $f == ".zsh" ]] && continue

  if [[ $f == ".vim" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/nvim
  elif [[ $f == ".alacritty.yml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/alacritty/alacritty.yml
  elif [[ $f == ".alacritty.default.yml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/alacritty/alacritty.default.yml
  elif [[ $f == ".starship.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/starship.toml
  elif [[ $f == ".sheldon.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/sheldon/plugins.toml
  elif [[ $f == ".rtx.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/rtx/config.toml
  else
    ln -snf "$DOTFILE_PATH/$f" ~/"$f"
  fi
done
