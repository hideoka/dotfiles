RUBY_VERSION=$1
DOTFILE_PATH=$2
cd $DOTFILE_PATH/lib/ruby

eval "$(rbenv init -)"

rbenv install RUBY_VERSION
rbenv globall RUBY_VERSION
gem install bundler
bundle install
