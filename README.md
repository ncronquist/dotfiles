Dotfiles
==========

Dotfiles focused on creating an intuitive and beautiful terminal experience.


Prerequisites
--------------

- Most of the dependencies will get automatically installed with the installation script, but fonts
  must be installed separately. So far, I've only gotten delugia code to work, but in theory all
  Powerline fonts should work
  - [Delugia Code](https://github.com/adam7/delugia-code)
  - [Powerline Fonts GitHub](https://github.com/powerline/fonts)
  - [Install Powerline Fonts in Windows](https://medium.com/@slmeng/how-to-install-powerline-fonts-in-windows-b2eedecace58)


Keyboard Shortcuts
-------------------

The list below mostly just notes changes to standard shortcuts, but there may
be some just for reference.

Note:
- `Key + key` means press the first key or key combination, and then press the second key
- `Key-key` means press both keys at the same time


### Zsh

Shortcut           | Description
-------------------|-------------
`Alt-c`            | fzf - cd into the selected directory
`Ctrl-t`           | fzf - Paste the selected files and directories onto the command-line
`Ctrl-r`           | fzf - Paste the selected command from history onto the command-line


### Tmux

Shortcut           | Description
-------------------|-------------
`Ctrl + <space>`   | Prefix
`Prefix + ?`       | Show all shortcuts
`Prefix + \|`      | Split window horizontally
`Prefix + -`       | Split window vertically
`Prefix + p`       | Switch to previous window (tmux-sensible)
`Prefix + n`       | Switch to next window (tmux-sensible)
`Prefix + [`       | Switch to Copy Mode
`v`                | Start copy selection in copy mode
`y`                | Copy selection in copy mode
`Prefix + i`       | Installs new plugins from GitHub or any other git repository and refreshes TMUX environment (tpm)
`Prefix + u`       | Updates plugins (tpm)
`Prefix + alt-u`   | Remove/uninstall plugins not on the plugin list


### Vim

Shortcut           | Description
-------------------|-------------
`<Space>`          | Leader
`Ctrl-p`           | fzf - fuzzy file finder
`Ctrl-b`           | NERDTree - Toggle file tree
`Ctrl-f`           | NERDTree - Find open file in file tree


Thanks
-------

Thanks to [Thoughtbot] and [Dragan] for the inspiration and the framework this repo uses.
I chose not to fork one of their repos because I don't intend to contribute my personal
preferences upstream. That being said, the framework/organization of this repo was
originally designed by Thoughtbot and Dragan was my inspiration for formally tracking
my dotfiles and using the Thoughtbot layout.

[Thoughtbot]: https://github.com/thoughtbot/dotfiles
[Dragan]: https://github.com/dragan/dotfiles
