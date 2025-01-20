#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd "$(dirname "$0")" && pwd)

mkdir -p "$HOME"/.config/alacritty
mkdir -p "$HOME"/.config/sheldon
mkdir -p "$HOME"/.config/mise
mkdir -p "$HOME"/.config/cspell
mkdir -p "$HOME"/.config/git

for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue
  [[ $f == ".zsh" ]] && continue
  [[ $f == ".gitignore" ]] && continue

  if [[ $f == ".vim" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/nvim
  elif [[ $f == ".alacritty.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/alacritty/alacritty.toml
  elif [[ $f == ".alacritty.default.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/alacritty/alacritty.default.toml
  elif [[ $f == ".starship.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/starship.toml
  elif [[ $f == ".sheldon.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/sheldon/plugins.toml
  elif [[ $f == ".mise.toml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/mise/config.toml
  elif [[ $f == ".cspell.config.yaml" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/cspell/cspell.config.yaml
  elif [[ $f == ".cspell.default.txt" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/cspell/cspell.default.txt
    touch ~/.config/cspell/cspell.local.txt
  elif [[ $f == ".git_ignore" ]]; then
    ln -snf "$DOTFILE_PATH/$f" ~/.config/git/ignore
  else
    ln -snf "$DOTFILE_PATH/$f" ~/"$f"
  fi
done
