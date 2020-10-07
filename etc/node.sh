NODE_VERSION=$1

if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  cd ~/.nodenv && src/configure && make -C src
  echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(nodenv init -)"' >> ~/.bash_profile
  exec "$SHELL"

  mkdir -p "$(nodenv root)"/plugins
  git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
fi

eval "$(nodenv init -)"

nodenv install $NODE_VERSION
nodenv global $NODE_VERSION
