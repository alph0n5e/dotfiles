# =================
# HISTORY
# =================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =================
# SHELL BEHAVIOR
# =================
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# =================
# COMPLETION
# =================
# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ":completion:*" menu select

# Make completion case-insensitive
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# =================
# FUZZY FINDER
# =================
# if MacOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# if MacOS / Homebrew (Apple Silicon)
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# if Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# =====================
# MODULAR CONFIG FILES
# =====================
# FZF config
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Prompt & theme
source "$ZDOTDIR/prompt.zsh"

# Plugins & manager
# source "$ZDOTDIR/plugins.zsh"

# POSTGRESQL
PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

export PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"


# pnpm
export PNPM_HOME="/Users/alph0n5e/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/alph0n5e/.docker/completions $fpath)
# End of Docker CLI completions

## Zoxide (better "cd", homebrew)
eval "$(zoxide init zsh)"

## UV Completion
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"


# opencode
export PATH=/Users/alph0n5e/.opencode/bin:$PATH
