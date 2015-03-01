#                __               __             
#               / /_  ____ ______/ /_  __________
#              / __ \/ __ `/ ___/ __ \/ ___/ ___/
#             / /_/ / /_/ (__  ) / / / /  / /__  
#            /_.___/\__,_/____/_/ /_/_/   \___/  
#           =====================================             
#                           K-9


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

 
# Control your history
HISTCONTROL=ignoreboth
# Ignore these commands
HISTIGNORE="reboot:shutdown *:ls:pwd:exit:mount:man *:history"
 

#
export GOPATH=~/Devel/Go
export GOBIN=~/Devel/Go/bin
export PATH="$PATH:~/bin:$GOBIN"
# Set history length via HISTSIZE and HISTFILESIZE
export HISTSIZE=10000
export HISTFILESIZE=10000
# Add timestamp to history file.
export HISTTIMEFORMAT="%F %T "
  
#for tmux: export 256color
#[ -n "$TMUX" ] && export TERM="xterm-256color"

  
# -- Alias
alias ls='ls --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='rm -I --preserve-root'
alias less='less -R'
alias tmux='TERM=xterm-256color tmux' # fixes bold fonts in vim while using tmux

  
# --  Fancy Prompt
PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]])\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"


# -- Setup colors for less and man
# note: the exit code for 256 colors is "38;5"
export LESS_TERMCAP_mb=$'\E[1;38;5;74m'    # begin bold
export LESS_TERMCAP_md=$'\E[1;38;5;74m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'            # turn off bold, blink, underline 
export LESS_TERMCAP_se=$'\E[0m'            # stop standout
export LESS_TERMCAP_so=$'\E[7;38;5;220m'   # start standout
export LESS_TERMCAP_ue=$'\E[0m'            # stop underline
export LESS_TERMCAP_us=$'\E[4;38;5;105m'   # start underline
