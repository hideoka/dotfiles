#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd $(dirname $0) && pwd)
PYTHON_VERSION=3.8.6
RUBY_VERSION=2.7.2
NODE_VERSION=14.13.0
TF_VERSION=latest

if [[ $(uname) == 'Darwin' ]]; then
  source $DOTFILE_PATH/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source $DOTFILE_PATH/etc/apt.sh
fi

# powerline font
git clone git@github.com:powerline/fonts.git --depth=1 $HOME/fonts
cd fonts
./install.sh
cd ..
rn -rf fonts

# neovim
cd $(dirname DOTFILE_PATH)
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install

git clone https://github.com/zplug/zplug $HOME/.zplug
source $DOTFILE_PATH/etc/python.sh $PYTHON_VERSION
source $DOTFILE_PATH/etc/ruby.sh $RUBY_VERSION $DOTFILE_PATH
source $DOTFILE_PATH/etc/node.sh $NODE_VERSION
source $DOTFILE_PATH/etc/terraform.sh $TF_VERSION
source $DOTFILE_PATH/etc/rust.sh
