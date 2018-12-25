#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

if [[ $(uname) == 'Darwin' ]]; then
  echo 'no_install'
elif [[ $(uname) == 'Linux' ]]; then
  bash ./etc/apt.sh
else
  echo 'no_install'
fi

bash ./etc/python.sh
bash ./etc/ruby.sh
