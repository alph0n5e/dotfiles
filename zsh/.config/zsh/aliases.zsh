# ===============
# ALIASES
# ===============
# eza: better ls
alias ls="eza --icons auto"
alias ll="eza -lh --icons auto --git"
alias la="eza -lha --icons auto --git"
alias tree="eza --tree --icons auto"
# Reuse ls completions for eza
compdef eza=ls

# bat: better cat
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then # Ubuntu-specific
  alias bat='batcat'
  alias cat='batcat'
fi

# fd: better find
if command -v fdfind >/dev/null 2>&1; then # Ubuntu-specific
  alias fd='fdfind'
fi

# neovim: better vim
alias vim=nvim

# ripgrep (rg): better grep
alias grep="rg --color=auto"

# other utilities
alias diff="diff --color=auto"
alias df="df -h"

# git
alias glog='PAGER="less -F -X" git log'
alias galog='PAGER="less -F -X" git log --all --decorate --oneline --graph'

# homebrew
alias brewtree='brew deps --tree $(brew list --installed-on-request)'
