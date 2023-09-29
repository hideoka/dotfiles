if ! which brew > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install zsh
brew install tmux
brew install tig
brew install xclip
brew install gawk
brew install gnu-sed
brew install libyaml
brew install reattach-to-user-namespace
brew install shellcheck
brew install neovim
brew install cmake
brew tap homebrew/cask-fonts
brew install font-hackgen
brew install font-hackgen-nerd
