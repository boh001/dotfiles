# fnm
eval "$(fnm env --use-on-cd --shell bash)"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="\u@\h:\w\n❯ "

export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_CTYPE=ko_KR.UTF-8
