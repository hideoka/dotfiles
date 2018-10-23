HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_save_no_dups
setopt correct
setopt auto_cd
setopt auto_pushd


mkdir_and_cd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}
