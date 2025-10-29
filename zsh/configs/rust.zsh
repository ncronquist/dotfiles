[ -f ~/.cargo/env ] && source ~/.cargo/env

# Add rust/cargo bin to path
[ -d ~/.cargo/bin ] && export PATH="$PATH:~/.cargo/bin"
