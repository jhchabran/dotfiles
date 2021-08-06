autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo " %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo " %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

autoload -Uz vcs_info
# zstyle ':vcs_info:*+*:*' debug true
zstyle ':vcs_info:*' enable git

setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:*'    formats "%f[%%n@%%m %1~] $ " "%f%a %F{3}%m%u%c %f%b:%r/%S"
zstyle ':vcs_info:*'    formats "%f[%%n@%%m %1~] $ " "%f%a %F{3}%m%u%c %f%b"
zstyle ':vcs_info:*'    nvcsformats   "%f[%n@%m %1~]$ " ""
zstyle ':vcs_info:*'    actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '

# export PROMPT='${vcs_info_msg_0_}'

export PROMPT=$'$(directory_name)%{$fg_bold[cyan]%}${vcs_info_msg_1_}%{$reset_color%} $ '

precmd() {
  vcs_info
}
