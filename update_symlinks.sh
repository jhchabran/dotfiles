#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
export DOTFILES_PATH=$HOME/.dotfiles
export PATH=$DOTFILES_PATH/bin:$PATH

setup_gitconfig () {
  announce "Setting up Git config" 1
  if ! [ -f "$DOTFILES_PATH/modules/git/gitconfig.local.symlink" ]
  then
     announce "building config" 2

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    announce 'What is your github author name?' 2
    read -e git_authorname
    announce ' - What is your github author email?' 2
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" "$DOTFILES_PATH/modules/git/gitconfig.local.symlink.example" > "$DOTFILES_PATH/modules/git/gitconfig.local.symlink"

    announce "build completed" 2
  else
    announce "build already exist. Delete it and retry if necessary: $DOTFILES_PATH/modules/git/gitconfig.local.symlink" 2
  fi
}


link_file () {
  announce "linking $1 to $2"

  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        announce "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?" 1
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      announce "removed $dst" 2
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      announce "moved $dst to ${dst}.backup" 2
    fi

    if [ "$skip" == "true" ]
    then
      announce "skipped $src" 2
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    announce "linked $1 to $2" 2
  fi
}

install_dotfiles () {
  announce 'installing dotfiles' 1

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_PATH/modules" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

setup_gitconfig
install_dotfiles
