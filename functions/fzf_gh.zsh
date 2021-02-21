fzf-gh-issues() {
  local FZF_GH_ISSUES_BASE_CMD=(gh issue list --limit 100)

  local res=$($FZF_GH_ISSUES_BASE_CMD | fzf \
    --ansi \
    --prompt='Open issue list>' \
    --bind "ctrl-a:reload($FZF_GH_ISSUES_BASE_CMD --state all)"    \
    --bind "ctrl-o:reload($FZF_GH_ISSUES_BASE_CMD --state open)"   \
    --bind "ctrl-x:reload($FZF_GH_ISSUES_BASE_CMD --state closed)" \
    --header='C-a: all, C-o: opened, C-x: closed' \
    --preview "gh issue view {1}")

  local issue_id=$(echo $res | awk '{ print $1 }')
  gh issue view --web $issue_id
}
 
