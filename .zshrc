export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

DOTFILE_PATH="$(dirname "$(readlink "$HOME/.zshrc")")"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export NODE_OPTIONS=--dns-result-order=ipv4first

source $DOTFILE_PATH/.zsh/setopt.zsh
source $DOTFILE_PATH/.zsh/fzf.zsh
source $DOTFILE_PATH/.zsh/alias.zsh
eval "$(sheldon source)"

if [[ -f $HOME/.local_zshrc.zsh ]];then
  source $HOME/.local_zshrc.zsh
fi

eval "$(starship init zsh)"
eval "$(mise activate zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit; compinit
