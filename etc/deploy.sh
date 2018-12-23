#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

for f in .??*
do
  [[ ${f} == ".git" ]] && continue
  [[ ${f} == ".DS_Store" ]] && continue
  [[ ${f} == ".zsh" ]] && continue

  if [[ ${f} == ".vim" ]]; then
    ln -snf ~/dotfiles/${f}/nvim ~/.config/nvim
  elif [[ ${f} == ".alacritty.yml" ]]; then
    ln -snf ~/dotfiles/${f} ~/.config/alacritty/alacritty.yml
  else
    ln -snf ~/dotfiles/${f} ~/${f}
  fi
done

source ~/.zshrc
