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
# Following removed in favor of 'pyenv' installs
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"

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

# POSTGRESQL
PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export PATH

# bun completions
[ -s "/Users/alph0n5e/.bun/_bun" ] && source "/Users/alph0n5e/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/alph0n5e/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/alph0n5e/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# UV (Python toolchain, astral-sh/uv)
export PATH="$HOME/.local/bin:$PATH"

### --- New Tools ---

## FZF (fuzzy finder, homebrew)
eval "$(fzf --zsh)"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

## FD (better "find" for FZF, homebrew)
## BAT (better "cat", homebrew)
## RG (a.k.a. ripgrep, better "grep", homebrew)

## EZA (better "ls", homebrew)
alias ls="eza --color=always --icons=always --long --git"

## Zoxide (better "cd", homebrew)
eval "$(zoxide init zsh)"

## Starship (command prompt)
eval "$(starship init zsh)"

