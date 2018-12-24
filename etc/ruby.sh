#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

cd ./lib/ruby
rbenv install 2.5.3
gem install bundler
bundle install
