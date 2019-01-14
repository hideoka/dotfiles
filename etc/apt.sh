sudo apt -y update
sudo apt -y install build-essential\
                    curl\
                    file\
                    zlib1g-dev\
                    libffi-dev\

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
