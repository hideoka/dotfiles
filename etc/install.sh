#!/usr/bin/env bash
set -Ceuo pipefail

if [[ $(uname) == 'Darwin' ]]; then
  source $DOTFILE_PATH/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source $DOTFILE_PATH/etc/apt.sh
fi

source $DOTFILE_PATH/etc/brew.sh
git clone https://github.com/zplug/zplug $HOME/.zplug
source $DOTFILE_PATH/etc/python.sh $DOTFILE_PATH
source $DOTFILE_PATH/etc/ruby.sh $DOTFILE_PATH
source $DOTFILE_PATH/etc/yarn.sh $DOTFILE_PATH
