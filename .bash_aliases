# Quicker navigation
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias mkdir='mkdir -pv'

# install  colordiff package :)
alias diff='colordiff'
alias mount='mount |column -t'
alias ports='netstat -tulanp'

# confirmation #
alias mv='mv -i'
alias rm='rm -i'
## this one saved by butt so many times ##
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'
alias dua='du -sh * | sort -h'
alias ls='ls -lah'
#alias ram='while read command percent rss; do if [[ "${command}" != "COMMAND" ]]; then rss="$(bc <<< "scale=2;${rss}/1024")"; fi; printf "%-26s%-8s%s\n" "${command}" "${percent}" "${rss}"; done < <(ps -A --sort -rss -o comm,pmem,rss | head -n 11)'
#alias duh='du -cBM -d1 2> > (grep -v 'Permission denied') | sort -n'
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias rank='sort| uniq -c|sort -n'
# Aspire entire website localy mirored
alias wgetsite='wget -mkEpnpc'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
