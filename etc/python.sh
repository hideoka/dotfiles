PYTHON_VERSION=$1

if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.bash_profile
  exec "$SHELL"

  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
  exec "$SHELL"
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

pyenv virtualenv $PYTHON_VERSION py3nvim
pyenv activate py3nvim
pip install pynvim
pyenv deactivate


if [[ $(uname) == 'Linux' ]]; then
  pip install pgcli
fi
