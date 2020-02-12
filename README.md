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


Installation
------------

Todo: Automate this part with some sort of curl | script.

For now:

- Clone this repo to `~/.dotfiles`
- Change into the install directory
- Run `sudo ./ubuntu base` to install the base requirements
- Run `./ubnutu asdf` to install asdf, the runtime version manager
- Start tmux `tmux new-session` and press `Ctrl-space + I` to install the tmux plugins
- Potentially want to restart your terminal


Keyboard Shortcuts
-------------------

The list below mostly just notes changes to standard shortcuts, but there may
be some just for reference.

Note:
- `Key + key` means press the first key or key combination, and then press the second key
- `Key-key` means press both keys at the same time
- `⬅ ⬆ ⬇ ➡` refer to the keyboard arrow keys


### Zsh

Shortcut           | Description
-------------------|-------------
`Alt-c`            | fzf - cd into the selected directory
`Ctrl-t`           | fzf - Paste the selected files and directories onto the command-line
`Ctrl-r`           | fzf - Paste the selected command from history onto the command-line
`⬆`                | zsh-history-substring-search - Search up through history; Typing search term first will limit searching to that term


### Tmux

Shortcut           | Description
-------------------|-------------
`Ctrl + <space>`   | Prefix
`Prefix + ?`       | Show all shortcuts
`Prefix + \|`      | Split window horizontally
`Prefix + -`       | Split window vertically
`Prefix + p`       | Switch to previous window (tmux-sensible)
`Prefix + n`       | Switch to next window (tmux-sensible)
`Ctrl-Shift-⬅`     | Move current window left
`Ctrl-Shift-➡`     | Move current window right
`Prefix + [`       | Switch to Copy Mode
`v`                | Start copy selection in copy mode
`y`                | Copy selection in copy mode
`Prefix + i`       | Installs new plugins from GitHub or any other git repository and refreshes TMUX environment (tpm)
`Prefix + u`       | Updates plugins (tpm)
`Prefix + alt-u`   | Remove/uninstall plugins not on the plugin list


### Vim

Shortcut / Command     | Description
-----------------------|-------------
`<Space>`              | Leader
`Ctrl-p`               | fzf - fuzzy file finder
`Tab`                  | Switch between buffers
`Shift-Tab`            | Switch between buffers reverse order
`Leader + n`           | NERDTree - Toggle file tree
`Leader + f`           | NERDTree - Find open file in file tree
`Leader + c + c`       | NERDCommenter - Comment line
`Leader + c + u`       | NERDCommenter - Uncomment line
`Leader + c + <space>` | NERDCommenter - Toggle comment
`Leader + -`           | Split pane down
`Leader + \|`          | Split pane right
`Leader + j`           | Switch to pane down
`Leader + k`           | Switch to pane up
`Leader + h`           | Switch to pane left
`Leader + l`           | Switch to pane right
`/`                    | Search for text
`Leader + <space>`     | Clear search highlights
`:bd`                  | Close buffer


Thanks
-------

Thanks to [Thoughtbot] and [Dragan] for the inspiration and the framework this repo uses.
I chose not to fork one of their repos because I don't intend to contribute my personal
preferences upstream. That being said, the framework/organization of this repo was
originally designed by Thoughtbot and Dragan was my inspiration for formally tracking
my dotfiles and using the Thoughtbot layout. Also thanks to [jessfraz] for most of my
install script.

[Thoughtbot]: https://github.com/thoughtbot/dotfiles
[Dragan]: https://github.com/dragan/dotfiles
[jessfraz]: https://github.com/jessfraz/dotfiles/blob/master/bin/install.sh
