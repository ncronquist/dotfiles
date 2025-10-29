export ASDF_GOLANG_MOD_VERSION_ENABLED=false

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

