#!/bin/sh

# Used https://github.com/holman/dotfiles as inspiration
# Check it out, its worth it

DOTFILES_ROOT="`pwd`"

set -e

# A little bit of flair.  I was bored.

if [ `tput cols` -gt 85 ]
then

cat <<EOF
__________      ___. /\         ________          __    _____.__.__                 
\______   \ ____\_ |_)/  ______ \______ \   _____/  |__/ ____\__|  |   ____   ______
 |       _//  _ \| __ \ /  ___/  |    |  \ /  _ \   __\   __\|  |  | _/ __ \ /  ___/
 |    |   (  <_> ) \_\ \\\___ \   |    \`   (  <_> )  |  |  |  |  |  |_\  ___/ \___ \ 
 |____|_  /\____/|___  /____  > /_______  /\____/|__|  |__|  |__|____/\___  >____  >
        \/           \/     \/          \/                                \/     \/ 


EOF

else
    echo "Welcome to Rob's Dotfiles"
fi

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  ln -s $1 $2
  success "linked $1 to $2"
}

install_dotfiles () {
  info 'installing dotfiles'

  overwrite_all=0
  backup_all=0
  skip_all=0


  for source in `find $1 -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"

    if [ -f $dest ] || [ -d $dest ]
    then

      overwrite=0
      backup=0
      skip=0

      if [ "$overwrite_all" -eq "0" ] && [ "$backup_all" -eq "0" ] && [ "$skip_all" -eq "0" ]
      then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read action

        case "$action" in
          o )
            overwrite=1;;
          O )
            overwrite_all=1;;
          b )
            backup=1;;
          B )
            backup_all=1;;
          s )
            skip=1;;
          S )
            skip_all=1;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" -eq "1" ] || [ "$overwrite_all" -eq "1" ]
      then
        rm -rf $dest
        success "removed $dest"
      fi

      if [ "$backup" -eq "1" ] || [ "$backup_all" -eq "1" ]
      then
        mv $dest $dest\.backup
        success "moved $dest to $dest.backup"
      fi

      if [ "$skip" -eq "0" ] && [ "$skip_all" -eq "0" ]
      then
        link_files $source $dest
      else
        success "skipped $source"
      fi

    else
      link_files $source $dest
    fi

  done
}

install_dir() {
    info "Installing $1"
    workingdir=$1

    install_dotfiles $workingdir

    if [ -f ${workingdir}install.sh ]; then

        ${workingdir}install.sh

    fi
}

install_all=0

for dir in $DOTFILES_ROOT/*/; do

    shortdir=${dir#$DOTFILES_ROOT/}
    shortdir=${shortdir%/}
    install_current=0

    if [ "$install_all" -eq "0" ]; then
        user "Would you like to install $shortdir? [Y]es, [N]o, [A]ll, [Q]uit"
        read action

        case "$action" in
            y* | Y*)
                install_current=1
                ;;

            a* | A*)
                install_all=1
                ;;

            q* | Q*)
                exit 0
                ;;

            * )
                ;;
        esac
    fi

    if [ "$install_all" -eq "1" ] || [ "$install_current" -eq "1" ]; then
        info "installing $shortdir"
        install_dir $dir
    fi

done

echo ''
echo '  All installed!'
