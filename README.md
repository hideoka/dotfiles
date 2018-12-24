# dotfiles

## install requirement
- pipenv
- alacritty
- rubocop
- gui-sed
- make
- git

## install python
```
# Install python version
pyenv install 3.7.0 # latest version

# Create a virtualenv for neovim folder
# In ~/dotfiles/lib/neovim
# Install neovim client and requirement middle 
pipenv install

# Show python path and write $pipenv_path for init.vim
pipenv --venv  #Note the path
```
## make command
```
# Create symbolic link
make deploy

# Initialize to install
make init
```
