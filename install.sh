#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd $(dirname $0) && pwd)
PYTHON_VERSION=3.8.1
RUBY_VERSION=2.6.5

if [[ $(uname) == 'Darwin' ]]; then
  source $DOTFILE_PATH/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source $DOTFILE_PATH/etc/apt.sh
fi

source $DOTFILE_PATH/etc/brew.sh
git clone https://github.com/zplug/zplug $HOME/.zplug
source $DOTFILE_PATH/etc/python.sh $PYTHON_VERSION $DOTFILE_PATH
source $DOTFILE_PATH/etc/ruby.sh $RUBY_VERSION
