alias ll="ls -al"
alias mkcd="mkdir_and_cd"

alias gd="git diff"
alias gs="git status"
alias gl="git log"
alias glp="git log -p"
alias gco="git_checkout"
alias ga="git add"
alias gc="git commit"
alias grh="git reset head"

alias vi="nvim"

alias ta="tmux a"
alias tn="tmux new -s"

if [[ $(uname) == 'Darwin' ]]; then
  alias sed="gsed"
  alias awk="gawk"
fi
