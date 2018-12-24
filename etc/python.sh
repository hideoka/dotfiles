#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

cd ./lib/python

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
source "$HOME/.bash_profile"

pyenv install 3.7.0
pyenv global 3.7.0
pyenv rehash
pip install --user pipenv
pipenv lock --pre --clear
pipenv install
