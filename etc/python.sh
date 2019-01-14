DOTFILE_PATH=$1
cd $DOTFILE_PATH/lib/python

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

pyenv install 3.7.0
pyenv global 3.7.0
