case $- in
    *i*) ;;
      *) return;;
esac

# Color definitions

black="\e[1;30m"
blue="\e[1;34m"
cyan="\e[1;36m"
green="\e[1;32m"
orange="\e[1;33m"
purple="\e[1;35m"
red="\e[1;31m"
white="\e[1;37m"
yellow="\e[1;33m"

# Shell exports

export EDITOR='vim';

export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export MANPAGER='less -X';

# Shell options

set -o noclobber

shopt -s cdspell
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob

# Command history

shopt -s histappend

export HISTSIZE=1000000000
export HISTFILESIZE=1000000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignoreboth:erasedups

# Shell aliases

alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias ll="ls -Glah"
alias nowtime="date +"%H:%M:%S""
alias nowdate="date +"%Y-%m-%d""
alias path="echo -e ${PATH//:/\\\n} | sort"
alias ping="ping -c 5"
alias ports="netstat -tulanp"

[ -x "$(command -v ccat)" ] && alias cat="ccat"
[ -x "$(command -v hub)" ] && alias git="hub"

# Shell functions

mkcd () {
   mkdir -p "$@" && eval cd "\"\$$#\"";
}

blt() {
   if [[ ! -z ${AH_SITE_ENVIRONMENT} ]]; then
      PROJECT_ROOT="/var/www/html/${AH_SITE_GROUP}.${AH_SITE_ENVIRONMENT}"
   elif [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
      PROJECT_ROOT=$(git rev-parse --show-cdup)
   else
      PROJECT_ROOT="."
   fi

   if [ -f "$PROJECT_ROOT/vendor/bin/blt" ]; then
      $PROJECT_ROOT/vendor/bin/blt "$@"
   elif [ -f "./vendor/bin/blt" ]; then
      ./vendor/bin/blt "$@"
   else
      echo "You must run this command from within a BLT-generated project."
      return 1
   fi
}

# Shell completion

brew_bin=$(which brew 2>/dev/null)

if [[ -n $brew_bin && -f $(${brew_bin} --prefix)/etc/bash_completion ]]; then
  source $(${brew_bin} --prefix)/etc/bash_completion
fi

# Extended bash prompt

if [[ $EUID -ne 0 ]]; then
   PS1="\[$green\]\u"
else
   PS1="\[$red\]\u"
fi

if [[ -n "$SSH_TTY" ]]; then
   PS1+="@\h"
fi

PS1+="\[$white\]:\[$blue\]\w"

if [[ "$(type -t __git_ps1)" = 'function' ]]; then
   export GIT_PS1_SHOWDIRTYSTATE=true
   export GIT_PS1_SHOWCOLORHINTS=true
   export GIT_PS1_UNTRACKEDFILES=true

   PS1+="\[$red\]\$(__git_ps1)"
fi

export PS1+="\[$white\]\$ "

# NVM and Nodejs

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
