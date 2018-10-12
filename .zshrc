source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verboe; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

PROMPT='%m:%c %n$ '
autoload -U compinit; compinit
setopt correct
setopt auto_cd
setopt auto_pushd

eval "$(rbenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
