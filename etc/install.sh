#!/usr/bin/env bash
set -Ceuo pipefail

if [[ $(uname) == 'Darwin' ]]; then
  echo 'no_install'
elif [[ $(uname) == 'Linux' ]]; then
  source $DOTFILE_PATH/etc/apt.sh
else
  echo 'no_install'
fi

source $DOTFILE_PATH/etc/python.sh $DOTFILE_PATH
source $DOTFILE_PATH/etc/ruby.sh $DOTFILE_PATH
