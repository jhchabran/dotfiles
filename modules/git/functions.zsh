gco() {
 git switch "$(git branch | fzf| tr -d '[:space:]')"
}
