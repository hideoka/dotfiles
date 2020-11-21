export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DOTFILE_PATH="$(dirname $(readlink $HOME/.zshrc))"

export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export GOPATH=$HOME/projects/go

source $DOTFILE_PATH/.zsh/setopt.zsh
source $DOTFILE_PATH/.zsh/fzf.zsh
source $DOTFILE_PATH/.zsh/alias.zsh
source $DOTFILE_PATH/.zsh/zplug.zsh

if [[ -f $HOME/.local_zshrc.zsh ]];then
  source $HOME/.local_zshrc.zsh
fi

autoload -U compinit; compinit

eval "$(starship init zsh)"

eval "$(rbenv init -)"

eval "$(nodenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
