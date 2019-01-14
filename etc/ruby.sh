DOTFILE_PATH=$1
cd $DOTFILE_PATH/lib/ruby

eval "$(rbenv init -)"

rbenv install 2.5.3
rbenv global 2.5.3
gem install bundler -v 1.17
bundle install
