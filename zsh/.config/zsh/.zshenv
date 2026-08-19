# ----- XDG base directories ------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ----- Editor ------
export EDITOR="nvim"
export VISUAL="nvim"

# ----- GPG ------
export GPG_TTY=$(tty)

# ----- Starship -----
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"

# ----- PATH ------
export PATH="$HOME/.local/bin:$PATH"
# Add Homebrew binaries to PATH
export PATH="/opt/homebrew/bin:${PATH}"

# Python
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"

# Visual Studio Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ----- RUST ------
. "$HOME/.cargo/env"

# ----- VITE+ ------
. "$HOME/.vite-plus/env"

# ----- Pager ------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ----- NVM ------
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# pnpm
export PNPM_HOME="/Users/alph0n5e/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
