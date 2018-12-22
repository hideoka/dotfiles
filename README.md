# dotfiles

## install requirement
- neovim
- pyenv
- pipenv
- tmux
- ripgrep
- alacritty
- ctags
- rubocop
- zsh
- zplug
- gui-sed

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
```
