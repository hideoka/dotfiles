PYTHON_VERSION=$1

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION
pyenv virtualenv $PYTHON_VERSION py3nvim
pyenv activate py3nvim
pip install pynvim
pyenv deactivate
