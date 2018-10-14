source $HOME/dotfiles/.zsh/alias.zsh
source $HOME/dotfiles/.zsh/setopt.zsh
source $HOME/dotfiles/.zsh/fzf.zsh
source $HOME/dotfiles/.zsh/zplug.zsh

autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

setopt correct
setopt auto_cd
setopt auto_pushd

eval "$(rbenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
