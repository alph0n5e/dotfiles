# BASH PS1
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

source ~/.bash/docker-machine-prompt.sh
source ~/.bash/colors.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

DOCKER_MACHINE_PS1_SHOWSTATUS=1

export PS1="\
\[${COLOR_DEFAULT}\]\u \[${COLOR_DARK_GRAY}\]@ \[${COLOR_DEFAULT}\]\h\[${COLOR_DARK_GRAY}\] in \[${COLOR_DEFAULT}\]\W\
\[${COLOR_LIGHT_CYAN}\]\$(__docker_machine_ps1 \" [%s]\")\[${COLOR_DEFAULT}\]\
\[${COLOR_LIGHT_YELLOW}\]\$(__git_ps1 \" (%s)\")\[${COLOR_DEFAULT}\]\[${COLOR_DARK_GRAY}\]:\n$\[${COLOR_DEFAULT}\] "

# Android (ADT)
export ANDROID_HOME=~/Code/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Homebrew GoLang
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Homebrew GoPath
export GOPATH=~/Workspace
export PATH=$PATH:$GOPATH/bin

export WORKON_HOME=~/.envs
source /usr/local/bin/virtualenvwrapper.sh

alias postgres.server="pg_ctl -D /usr/local/var/postgres/"

ulimit -S -n 1024

# Git Repos
export WORKSPACE=~/Workspace
export GITHUB_TZ=$WORKSPACE/src/github.com/Type-Zero/
export GITHUB_PERSO=$WORKSPACE/src/github.com/alph0n5e/
