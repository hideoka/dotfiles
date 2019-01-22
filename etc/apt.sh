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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
MANPATH=''
INFOPATH=''
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
