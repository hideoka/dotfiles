#!/usr/bin/env bash
set -Ceuo pipefail

if [[ $(uname) == 'Darwin' ]]; then
  echo 'no_install'
elif [[ $(uname) == 'Linux' ]]; then
  source ./etc/apt.sh
else
  echo 'no_install'
fi

source ./etc/python.sh $DOTFILE_PATH
source ./etc/ruby.sh $DOTFILE_PATH
