brew install zsh
brew install neovim
brew install pyenv
brew install rbenv
brew install tmux
brew install ripgrep
brew install tig
brew install yarn
brew install pyenv-virtualenv
brew install bat
brew install httpie
brew install pgcli
brew install xclip

if [[ $(uname) == 'Darwin' ]]; then
  brew install gawk
  brew install gnu-sed
  brew tap sanemat/font
  brew install ricty
  cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
  fc-cache -vf
  brew install reattach-to-user-namespace
  brew install unison
  brew install eugenmayer/dockersync/unox
fi
