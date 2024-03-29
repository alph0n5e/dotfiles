autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:git:*' formats ' %F{11}(%b) %u%c%f'

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

DOCKER_MACHINE_PS1_SHOWSTATUS=1

PROMPT=$'%B%n%b %F{7}@%f %B%m%b %F{7}in%f %B%~%b\$vcs_info_msg_0_%F{7}:%f\n%# '

# Aliases
alias ls='ls -GFh'
alias ll='ls -al'

# Homebrew 
PATH="/opt/homebrew/bin:${PATH}"

# Python
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# Ruby
PATH="/opt/homebrew/opt/ruby/bin:$PATH"
PATH="$HOME/.gem/ruby/3.1.0/bin:$PATH"

# NVM (non Homebrew)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Visual Studio Code
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# GoLang
export GOPATH="${HOME}/Code"
export GOBIN="${GOPATH}/bin"
PATH="$GOBIN:${PATH}"


export PATH
