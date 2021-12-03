# Resolves "Inappropriate ioctl for device" error
# https://stackoverflow.com/a/41054093
export GPG_TTY=$(tty)
