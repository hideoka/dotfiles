# dotfiles

## install requirement
- alacritty
- gui-sed # mac
- make
- git

## install python
```
# Install python version
pyenv install 3.7.0

# Create a virtualenv for neovim folder
# In ~/dotfiles/lib/neovim
# Install neovim client and requirement middle 
pip install --user pipenv
pipenv install

# Show python path and write $pipenv_path for init.vim
pipenv --venv  #Note the path
```

## install ruby
```
# Install ruby version
rbenv install 2.5.3

# global install for rubocop, docker-sync, solargraph
# In ~/dotfiles/lib/ruby
gem install bundler
bundle install
```

## make command
```
# Create symbolic link
make deploy

# Initialize to install
make init
```
