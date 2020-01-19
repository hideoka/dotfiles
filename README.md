# dotfiles

## install requirement
- make
- git
- curl
- alacritty

## make command
```
$ git clone https://github.com/hideoka/dotfiles.git
$ cd dotfiles
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
