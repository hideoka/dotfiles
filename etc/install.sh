#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

if [[ $(uname) == 'Darwin' ]]; then
  echo 'no_install'
elif [[ $(uname) == 'Linux' ]]; then
  ./etc/apt.sh
else
  echo 'no_install'
fi

./etc/python.sh
./etc/ruby.sh
