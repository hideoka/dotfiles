if ! which brew > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install zsh
brew install neovim
brew install pyenv
brew install rbenv
brew install nodenv
brew install tfenv
brew install tmux
brew install tig
brew install yarn
brew install pyenv-virtualenv
brew install httpie
brew install pgcli
brew install xclip
brew install starship
brew install gawk
brew install gnu-sed
brew install redis
brew tap sanemat/font
brew install ricty
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
brew install reattach-to-user-namespace
brew install unison
brew install eugenmayer/dockersync/unox
brew install shellcheck
