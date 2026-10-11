#!/usr/bin/env bash
set -Ceuo pipefail
DOTFILE_PATH=$(cd "$(dirname "$0")" && pwd)

if [[ $(uname) == 'Darwin' ]]; then
  source "$DOTFILE_PATH"/etc/osx.sh
elif [[ $(uname) == 'Linux' ]]; then
  source "$DOTFILE_PATH"/etc/apt.sh
fi

source "$DOTFILE_PATH"/etc/rust.sh "$DOTFILE_PATH"

curl -sS https://starship.rs/install.sh | sh

curl https://mise.run | sh
mise install
