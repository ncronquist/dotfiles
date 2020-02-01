# Enable extended globbing for use in _load_settings()
# Extended globbing allows zsh's extra expansion/globbing
# features. For example **/foo would do recursive
# globbing
setopt extendedglob

# If a pattern does not match, then pass it through as
# an argument to the command rather than throwing an error
# This allows for things like `git diff HEAD^`
setopt no_nomatch

# This function loads zsh configurations from ~/.zsh/configs/pre,
# ~/.zsh/configs, and ~/.zsh/configs/post in that order.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Aliases
source "$HOME/.aliases"
