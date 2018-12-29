DOTFILE_PATH=$1
cd $DOTFILE_PATH/lib/ruby

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv install 2.5.3
rbenv global 2.5.3
rbenv rehash
gem install bundler
bundle install
