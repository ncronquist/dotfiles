  # ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:$PATH"

# Deduplicates `$PATH` even when processes are launched
# that inherit the environment from an existing shell
# Reference:
# https://github.com/thoughtbot/dotfiles/commit/f074afeae3cd9075c0cca1078bc7dfdaa447bc9f
export -U PATH