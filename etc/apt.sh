#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

sudo apt -y install software-properties-common
sudo add-apt-repository ppa:hnakamur/universal-ctags
sudo apt -y update
sudo apt -y install curl
sudo apt -y install zsh
sudo apt -y install gawk
sudo apt -y install neovim
sudo apt -y install tmux
sudo apt -y install gcc
sudo apt -y install autoconf
sudo apt -y install pkg-config
sudo apt -y install universal-ctags

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb

export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
