# dotfiles

## install requirement
- make
- git
- alacritty
- curl
- gui-sed  #mac

## make command
Initialize to install python version 3.7.0 for pyenv and pipenv
Install neovim client and linter tool
Install ruby version 2.5.3 for rbenv global install for rubocop, docker-sync, solargraph
```
$ make init
```

## create symbolic link
create symbolic link to dotfiles
```
$ make deploy
```

## set up
create pipenv path
```
$ cd lib/Python
$ pipenv install
$ pipenv shell
# make a note of the pipenv hash
```

create .vimlocal file that wrote pipenv hash
```
# write to {pipenv hash}
$ echo "let g:pipenv_path_hash = '{pipenv hash}'" > ~/.vimlocal
```
