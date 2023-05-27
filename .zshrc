export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DOTFILE_PATH="$(dirname $(readlink $HOME/.zshrc))"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

source $DOTFILE_PATH/.zsh/setopt.zsh
source $DOTFILE_PATH/.zsh/fzf.zsh
source $DOTFILE_PATH/.zsh/alias.zsh
eval "$(sheldon source)"

if [[ -f $HOME/.local_zshrc.zsh ]];then
  source $HOME/.local_zshrc.zsh
fi

eval "$(starship init zsh)"

eval "$(rbenv init -)"

eval "$(nodenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
eval "$(pyenv virtualenv-init -)"

[ -f "/home/hideaki/.ghcup/env" ] && source "/home/hideaki/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit; compinit
