if [[ $(uname) == "Darwin" ]]; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:${MANPATH}"
  export TERM=alacritty
fi
