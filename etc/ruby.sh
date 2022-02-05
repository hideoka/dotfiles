RUBY_VERSION=$1
DOTFILE_PATH=$2

if [[ $(uname) == 'Linux' ]]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo -e 'eval "$(rbenv init -)"\n' >> ~/.bash_profile
  eval "$(rbenv init -)"

  mkdir -p "$(rbenv root)"/plugins
  git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
fi

cd "$DOTFILE_PATH/lib/ruby" || return
eval "$(rbenv init -)"

rbenv install "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
gem install bundler
touch "$DOTFILE_PATH/lib/ruby/Gemfile.lock"
bundle install
