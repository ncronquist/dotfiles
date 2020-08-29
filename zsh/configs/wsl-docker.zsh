# WSL 2 specific settings.
if grep -q "microsoft" /proc/version &>/dev/null; then
  # Don't set DOCKER_HOST for WSL 2
  # Do nothing
# WSL 1 specific settings.
elif grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
  export DOCKER_HOST=tcp://localhost:2375
fi

