export FZF_DEFAULT_COMMAND='rg --files --glob "!.git/*" --hidden'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

git_checkout() {
  local branches branch
  branches=$(git branch -vv --sort=-authordate) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
