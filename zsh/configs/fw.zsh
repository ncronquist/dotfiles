# https://github.com/brocode/fw

if [[ -x "$(command -v fw)" ]]; then
  if [[ -x "$(command -v fzf)" ]]; then
    eval $(fw print-zsh-setup -f 2>/dev/null);
  else
    eval $(fw print-zsh-setup 2>/dev/null);
  fi;
fi;
