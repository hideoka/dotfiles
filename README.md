# dotfiles

## install requirement
- neovim
- pyenv
- pyenv-vertualenv
- tmux
- ripgrep
- ctags
- fish
- fisherman
- rubocop

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

## Synbolic link
```
ln -s ~/dotfiles/.vim/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
ln -s ~/dotfiles/.fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/.fish/fishfile ~/.config/fish/fishfile
ln -s ~/dotfiles/.rubocop.yml ~/.rubocop.yml
```

## Add setting for config file
For $XDG_CONFIG_HOME/fish/conf.d/fzf.fish
```
set -x FZF_DEFAULT_COMMAND 'rg --files --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
```
