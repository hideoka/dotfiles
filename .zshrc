source $HOME/dotfiles/.zsh/setopt.zsh
source $HOME/dotfiles/.zsh/fzf.zsh
source $HOME/dotfiles/.zsh/alias.zsh
source $HOME/dotfiles/.zsh/zplug.zsh

autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
