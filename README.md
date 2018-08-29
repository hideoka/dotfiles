# dotfiles

## isntall requirement
- neovim
- pyenv
- pyenv-vertualenv
- tmux
- ripgrep
- ctags
- fish
- fisherman

## Synbolic link
```
ln -s ~/dotfiles/.vim/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ctags.d ~/.ctags.d
In -s ~/dotfiles/.fish/config.fish ~/.config/fish/config.fish
In -s ~/dotfiles/.fish/fishfile ~/.config/fish/fishfile
```

## Add setting for config file
Add for $XDG_CONFIG_HOME/fish/conf.d/fzf.fish
```
set -x FZF_DEFAULT_COMMAND 'rg --files --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
```
