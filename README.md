Dotfiles
==========

Dotfiles focused on creating an intuitive and beautiful terminal experience.

![terminal-screenshot](https://i.imgur.com/GNjrYoK.png)


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

- Most of the dependencies will get automatically installed with the installation script, but fonts
  must be installed separately. All NerdFonts should work, but on Windows/WSL, I've been using
  UbuntuMono NF.
  - [Nerd Fonts](https://www.nerdfonts.com/)
  - Install instructions
    - Download the font you want
    - Extract the zip file
    - Double click the font file to open it with the Windows font tool
    - Click the "Install" button in the Windows font tool


Installation
------------

Run the following command to download the dotfiles into your $HOME/.dotfiles directory.

```sh
curl -s https://raw.githubusercontent.com/ncronquist/dotfiles/master/install/ubuntu | bash -s -- dotfiles
```

If you ran the script above, you can skip the first step below to clone the repository.

- Clone this repo to `~/.dotfiles`
- Change into the install directory
- Run `sudo ./ubuntu base` to install the base requirements
- Run `./ubuntu asdf` to install asdf, the runtime version manager
- Run `./ubuntu pipx` to install pipx, for running python apps in virtual environments
- Run `./ubuntu fzf` to install fzf, for fuzzy file finding
- Run `./ubuntu zsh-default` to set your default shell to zsh (You will be asked to log out and
  log back in after this command)
- Run `source ~/.asdf/asdf.sh` to source asdf and use it to install neovim and tmux
  - Install neovim (see below)
  - Install tmux (see below)
- Change directories into the `~/.dotfiles` directory again
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
  asdf global neovim {version}

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
  asdf global tmux {version}
  ```

- Golang

  ```sh
  asdf plugin add golang

  asdf list all golang

  asdf install golang {version}

  # I also usually only work with one version of golang at a time, so set this
  # globally too
  asdf global golang {version}

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
  asdf global dotnet-core {version}
  ```

- Direnv - to automatically configure environment variables in directories with
  .envrc files

  ```sh
  asdf plugin add direnv

  asdf list all direnv

  asdf install direnv {version}

  # Since I really only ever use one version of direnv at a time, set it globally
  asdf global direnv {version}
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

Command or Alias                        | Description
----------------------------------------|-------------
`fra {find-text} {replace-text} {dir}`  | Find and replace text in a directory
`gbc`                                   | Interactively delete git branches
`tat {tmux-session-name}`               | Start or attach to tmux session
[Full Aliases List](./aliases)          |


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
`/`                    | Search for text in current file
`Leader + /`           | Search for text in the current project
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
