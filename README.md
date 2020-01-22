Dotfiles
==========

Dotfiles focused on creating an intuitive and beautiful terminal experience.


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
`Ctrl + <space>`   | Default prefix
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
`Ctrl-p`           | fzf - fuzzy file finder


Thanks
-------

Thanks to [Thoughtbot] and [Dragan] for the inspiration and the framework this repo uses.
I chose not to fork one of their repos because I don't intend to contribute my personal
preferences upstream. That being said, the framework/organization of this repo was
originally designed by Thoughtbot and Dragan was my inspiration for formally tracking
my dotfiles and using the Thoughtbot layout.

[Thoughtbot]: https://github.com/thoughtbot/dotfiles
[Dragan]: https://github.com/dragan/dotfiles
