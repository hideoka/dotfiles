#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

if [[ $(uname) == 'Darwin' ]]; then
  echo 'no_install'
elif [[ $(uname) == 'Linux' ]]; then
  ~/dotfiles/etc/apt.sh
else
  echo 'no_install'
fi
