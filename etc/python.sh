#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

cd ./lib/python
pyenv install 3.7.0
pip install --user pipenv
pipenv lock --pre --clear
pipenv install
