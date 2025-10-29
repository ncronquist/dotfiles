Dotfiles
==========

Dotfiles focused on creating an intuitive and beautiful terminal experience.

![terminal-screenshot](https://i.imgur.com/okW40Ik.png)


- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Extra Installs](#extra-installs)
- [Shell Commands and Aliases](#shell-commands-and-aliases)
- [Keyboard Shortcuts](#keyboard-shortcuts)
  - [Zsh](#zsh)
  - [Tmux](#tmux)
  - [Vim](#vim)
- [Thanks](#thanks)


Prerequisites
--------------

There are installation scripts in the [./install](./install) directory for different operating systems but keeping these up to date has been a losing battle. Going to just start adding a list of some of the more important ones that may or may not be obvious. You can also checkout the [ubuntu install script](./install/ubuntu) where the `base_min` function contains the most complete list of required deps.

- Your favorite terminal
  - (Suggested) [Ghostty]: Awesome terminal emulator for Mac and Linux
  - (Suggested Windows Alternative) [Microsoft Terminal]: Microsoft's modern terminal and console 
- [Zsh]: Shell designed for interactive use (Zsh is the default on Mac OS now, but the link provided shows how to install it on other platforms)
- [Ranger]: Console file manager with VI key bindings
- [Nerd Fonts]: Fonts that have been patched with a high number of glyphs (icons)
- [Pipx]: Install and run python apps in isolated environments
- [Fzf]: Fuzzy file finding
- [ripgrep]: line-oriented search tool (faster grep)
- [The Silver Searcher (ag)]: Code and file searching tool similar to ack or find, but with a focus on speed
- [fd]: fast alternative to find - find entries in your filesystem
- [asdf (getting started)]: Tool version manager
  - [Tmux]: Terminal multiplexer; Install with asdf (see below)
  - [Neovim]: Modern fork of Vim; Install with asdf (see below)

[Ghostty]: https://ghostty.org/
[Microsoft Terminal]: https://github.com/microsoft/terminal
[Zsh]: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
[Ranger]: https://github.com/ranger/ranger
[Nerd Fonts]: https://www.nerdfonts.com/
[Pipx]: https://pipx.pypa.io/latest/installation/
[Fzf]: https://github.com/junegunn/fzf
[ripgre]: https://github.com/BurntSushi/ripgrep
[The Silver Searcher (ag)]: https://github.com/ggreer/the_silver_searcher
[fd]: https://github.com/sharkdp/fd
[asdf (getting started)]: https://asdf-vm.com/guide/getting-started.html
[Tmux]: https://github.com/tmux/tmux/wiki
[Neovim]: https://neovim.io/


Installation
------------

- Clone this repo to `~/.dotfiles`
- Run `./ubuntu zsh-default` to set your default shell to zsh (You will be asked to log out and
  log back in after this command)
- Make sure to set your default shell to zsh (If you have to change this, you will need to log out and back in for the change to take effect)
- Change into the `~/.dotfiles` directory
- Enter a tmux session

  ```sh
  tmux new -s dotfiles
  ```
- Use rcm to configure the dotfiles; **This command will fail** because the tmux plugin manager
  (tpm) won't be ready the first time you run it. That's expected, so for any failure, first
  continue following the directions before trying to do any debugging.

  ```sh
  rcup -v

  # Enter "y" when it asks you to overwrite the .zshrc file
  ```
- Restart your terminal
- Change directories into the `~/.dotfiles` directory again
- Enter a tmux session again

  ```sh
  tmux new -s dotfiles
  ```
- Use rcm one more time to fully configure the dotfiles

  ```sh
  rcup -v
  ```


### Extra Installs

I use [asdf] to install and manage many different programs and runtimes. Read
more about asdf and using the .tool-versions file to automatically set package
versions on a per-project basis. The following instructions are for my most
commonly used plugins:

- Neovim

  ```sh
  asdf plugin add neovim

  asdf list all neovim

  asdf install neovim {version}

  # Since I really only ever use one version of neovim at a time, set it globally
  asdf set -u neovim {version}

  # Install the Python client for Neovim with apt
  sudo apt install python3-neovim

  # Or for non-Ubuntu users, use pip
  pip3 install --user --upgrade pynvim
  ```

- Tmux

  ```sh
  asdf plugin add tmux

  asdf list all tmux

  asdf install tmux {version}

  # Set tmux version globally
  asdf set -u tmux {version}
  ```

- Golang

  ```sh
  asdf plugin add golang

  asdf list all golang

  asdf install golang {version}

  # I also usually only work with one version of golang at a time, so set this
  # globally too
  asdf set -u golang {version}

  # After install golang, you'll need to reload your session for
  # GOROOT to be set
  reload # Reload is an alias for "source /home/ncronquist/.zshrc"

  # Note that if you install global Go packages, you will need to
  # reshim afterwards, for example:
  go get github.com/yusukebe/revealgo/cmd/revealgo

  asdf reshim golang {version}
  ```

- NodeJS

  ```sh
  asdf plugin add nodejs

  # Import the Node.js release team's OpenPGP keys to main keyring:
  bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

  asdf list all nodejs

  asdf install nodejs {version}
  ```

- Dotnet

  ```sh
  asdf plugin add dotnet-core

  asdf list all dotnet-core

  asdf install dotnet-core {version}

  # Since I generally only use one version of dotnet-core at a time, set it globally
  asdf set -u dotnet-core {version}
  ```

- Direnv - to automatically configure environment variables in directories with
  .envrc files

  ```sh
  asdf plugin add direnv

  asdf list all direnv

  asdf install direnv {version}

  # Since I really only ever use one version of direnv at a time, set it globally
  asdf set -u direnv {version}
  ```

- Terraform

  ```sh
  asdf plugin add terraform

  asdf list all terraform

  asdf install terraform {version}
  ```

[asdf]: https://asdf-vm.com/


Shell Commands and Aliases
---------------------------

| Command or Alias                       | Description                          |
| -------------------------------------- | ------------------------------------ |
| `fra {find-text} {replace-text} {dir}` | Find and replace text in a directory |
| `gbc`                                  | Interactively delete git branches    |
| `tat {tmux-session-name}`              | Start or attach to tmux session      |
| [Full Aliases List](./aliases)         |                                      |


Keyboard Shortcuts
-------------------

The list below mostly just notes changes to standard shortcuts, but there may
be some just for reference.

Note:
- `Key + key` means press the first key or key combination, and then press the second key
- `Key-key` means press both keys at the same time
- `⬅ ⬆ ⬇ ➡` refer to the keyboard arrow keys


### Zsh

| Shortcut | Description                                                                                                          |
| -------- | -------------------------------------------------------------------------------------------------------------------- |
| `Alt-c`  | fzf - cd into the selected directory                                                                                 |
| `Ctrl-t` | fzf - Paste the selected files and directories onto the command-line                                                 |
| `Ctrl-r` | fzf - Paste the selected command from history onto the command-line                                                  |
| `⬆`     | zsh-history-substring-search - Search up through history; Typing search term first will limit searching to that term |


### Tmux

| Shortcut            | Description                                                                                       |
| ------------------- | ------------------------------------------------------------------------------------------------- |
| `Ctrl + <space>`    | Prefix                                                                                            |
| `Prefix + ?`        | Show all shortcuts                                                                                |
| `Prefix + \|`       | Split window horizontally                                                                         |
| `Prefix + -`        | Split window vertically                                                                           |
| `Prefix + p`        | Switch to previous window (tmux-sensible)                                                         |
| `Prefix + n`        | Switch to next window (tmux-sensible)                                                             |
| `Prefix + {number}` | Switch to the numbered window                                                                     |
| `Ctrl-Shift-⬅`     | Move current window left                                                                          |
| `Ctrl-Shift-➡`     | Move current window right                                                                         |
| `Prefix + [`        | Switch to Copy Mode                                                                               |
| `v`                 | Start copy selection in copy mode                                                                 |
| `y`                 | Copy selection in copy mode                                                                       |
| `Prefix + r`        | Refresh tmux configuration                                                                        |
| `Prefix + i`        | Installs new plugins from GitHub or any other git repository and refreshes TMUX environment (tpm) |
| `Prefix + u`        | Updates plugins (tpm)                                                                             |
| `Prefix + alt-u`    | Remove/uninstall plugins not on the plugin list                                                   |


### Vim

| Shortcut / Command | Description                                                         |
| ------------------ | ------------------------------------------------------------------- |
| `<Space>`          | Leader                                                              |
| **Files**          |                                                                     |
| `Ctrl-p`           | Telescope - Fuzzy find git files                                    |
| **Buffers**        |                                                                     |
| `Tab`              | Switch between buffers                                              |
| `Shift-Tab`        | Switch between buffers reverse order                                |
| `Leader + <space>` | Search current buffers names                                        |
| `:bd`              | Close buffer                                                        |
| **Panes**          |                                                                     |
| `Leader + -`       | Split pane down                                                     |
| `Leader + \|`      | Split pane right                                                    |
| `Leader + x`       | Close split window pane (Won't close the last window)               |
| `Leader + j`       | Switch to pane down                                                 |
| `Leader + k`       | Switch to pane up                                                   |
| `Leader + h`       | Switch to pane left                                                 |
| `Leader + l`       | Switch to pane right                                                |
| **File Tree**      |                                                                     |
| `Leader + n`       | neo-tree - Toggle file tree                                         |
| `Leader + f`       | neo-tree - Find open file in file tree                              |
| **Text**           |                                                                     |
| `Ctrl-/`           | Toggle line comment (works in visual mode to toggle multiple lines) |
| `/`                | Search for text in current file                                     |
| `Leader + /`       | Fuzzy search for text in current file                               |
| `Leader + s + g`   | Fuzzy search for text across all project files                      |
| `Leader + s + /`   | Fuzzy search for text across open files                             |
| `Esc`              | Clear search highlights                                             |


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
