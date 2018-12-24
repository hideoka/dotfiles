#!/usr/bin/env bash
set -Ceuo pipefail

export LC_ALL=C
export LANG=C

sudo apt -y install software-properties-common
sudo add-apt-repository ppa:hnakamur/universal-ctags -y
sudo apt -y update
sudo apt -y install build-essential\
                    libssl-dev\
                    zlib1g-dev\
                    libbz2-dev \
                    libreadline-dev\
                    libsqlite3-dev\
                    gcc\
                    wget\
                    llvm\
                    libncurses5-dev\
                    libncursesw5-dev \
                    xz-utils\
                    tk-dev\
                    libffi-dev\
                    liblzma-dev\
                    python-openssl\
                    curl\
                    zsh\
                    gawk\
                    neovim\
                    tmux\
                    autoconf\
                    pkg-config\
                    universal-ctags

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb

git clone https://github.com/zplug/zplug $HOME/.zplug

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
mkdir -p $HOME/.rbenv/plugins
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build

rm -rf ~/dotfiles/ripgrep_0.10.0_amd64.deb
