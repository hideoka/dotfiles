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

## install python
```
# Install python version
pyenv install 2.7.15 # latest version
pyenv install 3.7.0 # latest version

# Create pyenv-vertualevn for neovim reference
pyenv virtualenv 2.7.15 neovim2
pyenv virtualenv 3.7.0 neovim3

# Install neovim client and requirement middle 
pyenv activate neovim2
pyenv which python  # Note the path
pyenv deactivate

pyenv activate neovim3
pyenv which python  # Note the path
pyenv deactivate
```

## Synbolic link
```
ln -s ~/dotfiles/.vim/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
In -s ~/dotfiles/.fish/config.fish ~/.config/fish/config.fish
In -s ~/dotfiles/.fish/fishfile ~/.config/fish/fishfile
```

## Add setting for config file
For $XDG_CONFIG_HOME/fish/conf.d/fzf.fish
```
set -x FZF_DEFAULT_COMMAND 'rg --files --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
```
