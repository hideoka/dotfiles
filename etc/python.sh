#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

cd ./lib/python

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

pyenv install 3.7.0
pyenv global 3.7.0
pyenv rehash
pip install --user pipenv
pipenv lock --pre --clear
pipenv install
