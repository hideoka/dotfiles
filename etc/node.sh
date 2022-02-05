NODE_VERSION=$1

if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(nodenv init -)"' >> ~/.bash_profile
  eval "$(nodenv init -)"

  git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
fi

eval "$(nodenv init -)"

nodenv install "$NODE_VERSION"
nodenv global "$NODE_VERSION"

npm install -g typescript
npm install -g ts-node
npm install -g typescript-language-server
