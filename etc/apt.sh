sudo apt -y update
sudo apt -y install build-essential\
                    curl\
                    file\
                    zlib1g-dev\
                    libffi-dev\
                    libreadline-dev

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
