TF_VERSION=$1

if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
  echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile

  export PATH="$HOME/.tfenv/bin:$PATH"
fi

tfenv install "$TF_VERSION"
