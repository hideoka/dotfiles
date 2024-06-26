#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd "$(dirname "$0")" && pwd)

if [[ $(uname) == 'Darwin' ]]; then
  source "$DOTFILE_PATH"/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source "$DOTFILE_PATH"/etc/apt.sh
fi

# neovim
if [[ $(uname) == 'Linux' ]]; then
  cd "$(dirname "$DOTFILE_PATH")"
  git clone https://github.com/neovim/neovim
  cd neovim && make CMAKE_BUILD_TYPE=Release
  sudo make install
fi

source "$DOTFILE_PATH"/etc/rust.sh "$DOTFILE_PATH"
mise install
