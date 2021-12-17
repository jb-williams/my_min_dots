alias fuck='sudo shutdown now'
alias update='sudo apt update -y'
alias upgrade='sudo apt upgrade -y'
alias cleanup='sh ~/scripts/cleanup.sh'
alias :q='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias ls='ls --color=always --group-directories-first' # list all
alias la='ls -a --color=always --group-directories-first' # list all
alias ll='ls -lah --color=always --group-directories-first' # long list all human readable
alias lt='ls -aT --color=always --group-directories-first' # tree listing
alias l.='ls -a --color=always --group-directories-first | grep "^\." --color=always' # dots only
alias cpi='cp -i'
alias mvi='mv -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias norg='gron --ungron'
alias ungron='gron --ungron'
alias vimpress='VIMENV=talk vim'
alias v='vagrant'
alias d='sudo docker'
alias j='jobs'
alias follow='tail -f -n +1'
alias biggest='du -h --max-depth=1 | sort -h'
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# get error messages from journalctl
alias jctl='journalctl -p 3 -xb'


