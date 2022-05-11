#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd "$(dirname "$0")" && pwd)
PYTHON_VERSION=3.10.4
RUBY_VERSION=3.1.2
NODE_VERSION=16.14.0
TF_VERSION=latest

if [[ $(uname) == 'Darwin' ]]; then
  source "$DOTFILE_PATH"/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source "$DOTFILE_PATH"/etc/apt.sh
fi

# powerline font
git clone git@github.com:powerline/fonts.git --depth=1 "$HOME"/fonts
cd "$HOME"/fonts
./install.sh
cd ..
rm -rf fonts

# neovim
cd "$(dirname "$DOTFILE_PATH")"
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install

git clone https://github.com/zplug/zplug "$HOME"/.zplug

source "$DOTFILE_PATH"/etc/python.sh "$PYTHON_VERSION"
source "$DOTFILE_PATH"/etc/ruby.sh "$RUBY_VERSION" "$DOTFILE_PATH"
source "$DOTFILE_PATH"/etc/node.sh "$NODE_VERSION"
source "$DOTFILE_PATH"/etc/terraform.sh "$TF_VERSION"
source "$DOTFILE_PATH"/etc/rust.sh "$DOTFILE_PATH"

cd "$(dirname "$DOTFILE_PATH")"
