#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd "$(dirname "$0")" && pwd)
PYTHON_VERSION=3.11.1
RUBY_VERSION=3.2.0
NODE_VERSION=18.13.0
TF_VERSION=latest

if [[ $(uname) == 'Darwin' ]]; then
  source "$DOTFILE_PATH"/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source "$DOTFILE_PATH"/etc/apt.sh
fi

# neovim
cd "$(dirname "$DOTFILE_PATH")"
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install

source "$DOTFILE_PATH"/etc/rust.sh "$DOTFILE_PATH"
rtx install
npm install -g typescript ts-node typescript-language-server
