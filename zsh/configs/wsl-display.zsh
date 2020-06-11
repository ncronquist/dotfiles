if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
  # For use with VcXsrv
  export DISPLAY=:0
fi
