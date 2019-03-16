export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DOTFILE_PATH="$(dirname $(readlink $HOME/.zshrc))"

if [[ $(uname) == 'Linux' ]]; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
  export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export GOPATH="$HOME/src/go"
export PATH="$GOPATH/bin:$PATH"

source $DOTFILE_PATH/.zsh/setopt.zsh
source $DOTFILE_PATH/.zsh/fzf.zsh
source $DOTFILE_PATH/.zsh/alias.zsh
source $DOTFILE_PATH/.zsh/zplug.zsh

autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

eval "$(rbenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
