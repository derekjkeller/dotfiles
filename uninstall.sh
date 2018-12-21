#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd)

declare -a files=(
   ".atom"
   ".bash_profile"
   ".bashrc"
   ".gitconfig"
   ".gitignore_global"
   ".hushlogin"
   ".vimrc"
   "Brewfile"
)

for file in ${files[@]}; do
   if [ -h $HOME/$file ]; then
      rm $HOME/$file
   fi

   if [ -f $HOME/$file.orig ]; then
      mv $HOME/$file{.orig,}
   fi
done
