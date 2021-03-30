RUBY_VERSION=$1
DOTFILE_PATH=$2

if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo -e 'eval "$(rbenv init -)"\n' >> ~/.bash_profile
  exec "$SHELL"

  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-buildmkdir -p "$(rbenv root)"/plugins
fi

cd $DOTFILE_PATH/lib/ruby

eval "$(rbenv init -)"

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION
gem install bundler
touch $DOTFILE_PATH/lib/ruby/Gemfile.lock
bundle install
