
# Add vim or nano as default editor
export EDITOR=nano
export TERMINAL=urxvt
export BROWSER=firefox
#export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

# Set default editor
export EDITOR=$custom_editor || "nano"

# sharing of history between multiple terminals 
# histfile has to be read and saved after each command execution
#PROMPT_COMMAND="history -n; history -w; history -c; history -r"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Unlimited history size for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
unset HISTSIZE
unset HISTFILESIZE
# set pager
#export PAGER=/usr/bin/most

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Gtk themes 
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xhost +local:root > /dev/null 2>&1

complete -cf sudo
complete -cf man

# Shopt
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete
shopt -s nocaseglob


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

color_prompt=yes

# Bash Completion
if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

# Alias definitions.
if [ -x ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions.
if [ -x ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Prompt definitions.
if [ -x ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# Color man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}
## UNCOMPRESSION FUNCTION ##
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz) tar xzf $1    ;;
      *.bz2)    bunzip2 $1    ;;
      *.rar)    rar x $1    ;;
      *.gz)   gunzip $1   ;;
      *.tar)    tar xf $1   ;;
      *.tbz2)   tar xjf $1    ;;
      *.tgz)    tar xzf $1    ;;
      *.zip)    unzip $1    ;;
      *.Z)    uncompress $1 ;;
      *)      echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# cd and ls in one
cl() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cl: '$dir': Directory not found"
    fi
}

# test encode & decode base64
decode () {
  echo "$1" | base64 -d ; echo
}

encode () {
  echo "$1" | base64 - ; echo
}


# prompt
PS1="\[\e[01;37m\]┌─[\t][$]: \w\[\e[01;37m\]\n\[\e[01;37m\]└──\[\e[01;37m\]──╼\[\e[0m\] "
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

t () {
    echo -ne "\\e]2;$1\\a"
    }
get_crtime() {

    for target in "${@}"; do
        inode=$(stat -c '%i' "${target}")
        fs=$(df  --output=source "${target}"  | tail -1)
        crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | 
        grep -oP 'crtime.*--\s*\K.*')
        printf "%s\t%s\n" "${target}" "${crtime}"
    done
}
if [ -f /usr/bin/screenfetch ]; then XDG_CURRENT_DESKTOP='None' screenfetch -t; fi
alias ls='ls -F --color=auto'
#if [[ -z "$TMUX" ]] ;then
#    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
#    if [[ -z "$ID" ]] ;then # if not available create a new one
#        tmux new-session
#    else
#        tmux attach-session -t "$ID" # if available attach to it
#    fi
#fi
#### DATE AND TIME IN HISTORY
export HISTTIMEFORMAT="%h/%d - %H:%M:%S"
alias xflock4='light-locker-command -l'
PROMPT_COMMAND='history -a >(tee -a ~/.bash_history | logger -t "$USER[$$] $SSH_CONNECTION")'
