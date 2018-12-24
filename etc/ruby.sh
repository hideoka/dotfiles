#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

cd ./lib/ruby

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv install 2.5.3
rbenv global 2.5.3
rbenv rehash
gem install bundler
bundle install
