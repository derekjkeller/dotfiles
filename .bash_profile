export PATH="/usr/local:/usr/local/sbin:$PATH"

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# Terminal window

PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"

# SSH agents

grep -slR "PRIVATE" "$HOME/.ssh" | xargs ssh-add -K &>/dev/null
