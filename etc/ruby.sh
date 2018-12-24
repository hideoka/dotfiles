#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

cd ./lib/ruby

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source "$HOME/.bash_profile"

rbenv install 2.5.3
rbenv global 2.5.3
rbenv rehash
gem install bundler
bundle install
