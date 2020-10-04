RUBY_VERSION=$1
DOTFILE_PATH=$2

#---- Setup pyenv
if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo -e 'eval "$(rbenv init -)"\n' >> ~/.bash_profile
  exec "$SHELL"
fi

cd $DOTFILE_PATH/lib/ruby

eval "$(rbenv init -)"

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
gem install bundler
bundle install
