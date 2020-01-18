# dotfiles

## install requirement
- make
- git
- alacritty
- curl
- gui-sed  #mac

## make command
Initialize to install python for pyenv
Install neovim client and linter tool
Install ruby for rbenv global install for rubocop, docker-sync, solargraph
```
$ make init
```

## create symbolic link
create symbolic link to dotfiles
```
$ make deploy
```

## set up
create python path
```
$ cd lib/Python
$ pyenv install 3.8.1 # specific version
$ pyenv virtualenv 3.8.1 py3nvim
$ pyenv activate py3nvim
$ pip install pynvim
$ pyenv deactivate
```
