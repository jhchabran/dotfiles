export fpath=(${ASDF_DIR}/completions $fpath)

# https://github.com/junegunn/fzf
# Reminder: fzf.zsh has completion related code, so it needs to be loaded after compinit
# so it must be in this file rather than others to ensure that's the case.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
