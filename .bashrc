case $- in
    *i*) ;;
      *) return;;
esac

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
alias nowtime='date +"%H:%M:%S"'
alias nowdate='date +"%Y-%m-%d"'
alias path="echo -e \${PATH//:/\\\n} | sort"
alias ping="ping -c 5"
alias ports="netstat -tulanp"

[ -x "$(command -v ccat)" ] && alias cat="ccat"
[ -x "$(command -v hub)" ] && alias git="hub"

# Shell functions

mkcd () {
   mkdir -p "$@" && eval cd "\"\$$#\"";
}

# Shell completion

brew_bin=$(command -v brew 2>/dev/null)

if [[ -n $brew_bin && -f $(${brew_bin} --prefix)/etc/bash_completion ]]; then
  source "$(${brew_bin} --prefix)/etc/bash_completion"
fi

# Extended bash prompt

black="\e[1;30m"
blue="\e[1;34m"
cyan="\e[1;36m"
green="\e[1;32m"
orange="\e[1;33m"
purple="\e[1;35m"
red="\e[1;31m"
white="\e[1;37m"
yellow="\e[1;33m"
reset='\e[0m'

if [[ "$(type -t __git_ps1)" = "function" ]]; then
    export GIT_PS1_SHOWDIRTYSTATE=true
    export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_UNTRACKEDFILES=true

    git_check=true
fi

set_prompt() {
  prompt="\[$green\]local:\[$blue\]\w"

  [[ $git_check ]] && prompt+="\[$red\]\$(__git_ps1)"
  prompt+="\[$reset\]$ "

  PS1=$(printf "%s" "$prompt")
}

export PROMPT_COMMAND="set_prompt"

# NVM and Nodejs

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
