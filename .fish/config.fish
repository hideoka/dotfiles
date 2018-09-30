set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)

# neovim config path
set -x XDG_CONFIG_HOME ~/.config/

# golang config
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

# fzf config
set -x FZF_DEFAULT_COMMAND 'rg --files --glob "!.git/*"'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND


function fco -d 'Fuzzy-find and checkout a branch'
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end


function fzf-cdhist-widget -d 'cd to one of the previously visited locations'
  # Clear non-existent folders from cdhist.
  set -l buf
  for i in (seq 1 (count $dirprev))
    set -l dir $dirprev[$i]
    if test -d $dir
      set buf $buf $dir
    end
  end
  set dirprev $buf
  string join \n $dirprev | tail -r | sed 1d | eval (__fzfcmd) +m --tiebreak=index --toggle-sort=ctrl-r $FZF_CDHIST_OPTS | read -l result
  [ "$result" ]; and cd $result
  commandline -f repaint
end
