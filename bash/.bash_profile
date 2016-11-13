# --------------------
# TERMINAL
# --------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

source ~/.bash/colors.sh

export DEFAULT_USER=alph0n5e
export DEFAULT_HOSTNAME=Antoines-MBP.local

parse_hostname() {
    if [[ `hostname` != $DEFAULT_HOSTNAME ]];then
	      printf "\[${COLOR_DARK_GRAY}\]@\[${COLOR_YELLOW}\]\h\[${COLOR_DEFAULT}\]"
    fi
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

export PS1="\[${COLOR_DEFAULT}\]\u$(parse_hostname)\[${COLOR_DARK_GRAY}\]: \W\[${COLOR_DEFAULT}\]\$(__git_ps1)$ "

# --------------------
# PYTHON
# --------------------

alias python='python3'

# --------------------
# SHORTCUTS
# --------------------

export WS=~/Workspace
export GH=$WS/src/github.com/alph0n5e
