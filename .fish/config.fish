status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)

set -x XDG_CONFIG_HOME ~/.config/
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH
