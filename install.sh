#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd)

declare -a files=(
   ".bash_profile"
   ".bashrc"
   ".gitconfig"
   ".gitignore_global"
   ".hushlogin"
   ".vimrc"
)

for file in ${files[@]}; do
   if [ -f $HOME/$file ] && ! [ -h $HOME/$file ]; then
      mv $HOME/$file{,.orig}
   fi

   ln -sfn $SCRIPT_PATH/$file $HOME
done

if [[ -x "$(command -v atom)" ]]; then
   if [ -d $HOME/.atom ] && ! [ -h $HOME/.atom ]; then
      mv $HOME/.atom{,.orig}
   fi

   ln -sfn $SCRIPT_PATH/.atom $HOME
fi

if [[ -x "$(command -v brew)" ]]; then
   if [ -f $HOME/Brewfile ] && ! [ -h $HOME/Brewfile ]; then
      mv $HOME/Brewfile{,.orig}
   fi

   ln -sfn $SCRIPT_PATH/Brewfile $HOME
fi
