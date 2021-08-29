################################################################################
# This script was originally added to support copy and paste by sharing xclip
# using a Windows X-Server. Since I no longer use the X-server functionality
# for copy/paste or running Linux GUI programs, I'm turning this off, but
# leaving it here to be more findable than throug a git history search.
#
# For WSL, there are a couple of ways to get copy/paste to work
# One is to install an X-Server on Windows like VcXsrv and use xclip
# on WSL to share the clipboard between WSL and Windows
# The other option is to install win32yank.exe
# https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
################################################################################

# # WSL 2 specific settings.
# if grep -q "microsoft" /proc/version &>/dev/null; then
#     # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
#     export DISPLAY="$(/sbin/ip route | awk '/default/ { print $3 }'):0"
#     export LIBGL_ALWAYS_INDIRECT=1
# fi
#
# # WSL 1 specific settings.
# if grep -qE "(Microsoft|WSL)" /proc/version &>/dev/null; then
#     if [ "$(umask)" = "0000" ]; then
#         umask 0022
#     fi
#
#     # Requires: https://sourceforge.net/projects/vcxsrv/ (or alternative)
#     export DISPLAY=:0
# fi
