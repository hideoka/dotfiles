sudo apt -y update
sudo apt -y install build-essential\
                    curl\
                    file\
                    zlib1g-dev\
                    libffi-dev\
                    libreadline-dev\
                    zsh\
                    locales

sudo locale-gen "en_US.UTF-8"
sudo update-locale
if ! which brew > /dev/null 2>&1; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  MANPATH=''
  INFOPATH=''
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi
