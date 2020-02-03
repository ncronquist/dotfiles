# Completion
autoload -U compinit
compinit

# According to https://github.com/zsh-users/zsh-syntax-highlighting,
# zsh-syntax-highlighting must be sourced after running compinit
# In orer to use zsh-syntax-highlighting with zsh-history-substring search,
# highlighting must be loaded first
source "$HOME/.local/share/zsh/functions/zsh-syntax-highlighting"
source "$HOME/.local/share/zsh/functions/zsh-history-substring-search"

# Bind Up and Down arrow keys to zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
# The binding has to happen after the zsh-history-substring-search
# function has been sourced
if [[ -z "$WSL_DISTRO_NAME" && -v "$WSLENV" ]]; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
else
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi
