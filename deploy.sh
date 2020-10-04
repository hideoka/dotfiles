#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd $(dirname $0) && pwd)

if [[ $(uname) == 'Darwin' ]]; then
  mkdir -p $HOME/.config/alacritty
fi

mkdir -p $HOME/.config/pgcli

for f in .??*
do
  [[ $f == ".git" ]] && continue
  [[ $f == ".DS_Store" ]] && continue
  [[ $f == ".zsh" ]] && continue

  if [[ $f == ".vim" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/nvim
  elif [[ $f == ".alacritty.yml" && $(uname) == 'Darwin' ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/alacritty/alacritty.yml
    echo "ok"
  elif [[ $f == ".pgclirc" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/pgcli/config
  elif [[ $f == ".starship.toml" ]]; then
    ln -snf $DOTFILE_PATH/$f ~/.config/starship.toml
  else
    ln -snf $DOTFILE_PATH/$f ~/$f
  fi
done
