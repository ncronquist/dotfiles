# asdf-vm is used to manage go installations
# asdf doesn't set the GOPATH or GOROOT environment variables. asdf and
# `go env` work to put everything in the right place, but sometimes
# other tooling expects those Go environment variables to be set
# The below exports set the GOPATH and GOROOT environment variables
# based on the version of Go asdf is currently set to use
# Note that when installing system level Go modules, you need asdf to
# reshim go with `asdf reshim golang {current-go-version}`
export ASDF_GO=$(asdf where golang)
export GOPATH="$ASDF_GO/packages"
export GOROOT="$ASDF_GO/go"
