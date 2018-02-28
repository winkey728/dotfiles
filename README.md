[![Build Status](https://travis-ci.org/winkey728/dotfiles.svg?branch=master)](https://travis-ci.org/winkey728/dotfiles)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Winkey's dotfiles :wrench:
This repository is used for setting up my new development environment on macOS and Arch Linux(Manjaro). It contains my dotfiles and configurations with my favorite settings.

## Setup
(:warning: __These are the settings for myself__, *__PLEASE TAKE IT SERIOUSLY BEFOR YOU RUN__*)

To set up the `dotfiles` just run the appropriate snippet in the
terminal:

| OS | Snippet |
|:---|:---|
| `macOS` | `bash -c "$(curl -LsS https://raw.githubusercontent.com/winkey728/dotfiles/master/src/bootstrap/setup.sh)"` |
| `Manjaro`     | `bash -c "$(wget -qO - https://raw.githubusercontent.com/winkey728/dotfiles/master/src/bootstrap/setup.sh)"` |

and then wait for the completion.

**NOTE: It will take a long time to finished, and I recommand to setup a VPN if you run it on macOS.**

The setup process will:

* Download the dotfiles on your computer (by default it will suggest `~/project/github/dotfiles`)
* Create some [directories](src/bootstrap/directories.sh)
* [Symlink](src/bootstrap/symbol_link.sh) the dotfiles (
  [git](src/symlinks/git),
  [tmux](src/symlinks/tmux),
  [vim](src/symlinks/vim),
  [zsh](src/symlinks/zsh)
  and [etc](src/symlinks/git).
)
* Install command-line tools / GUI applications for
  [macOS](src/installations/macos) /
  [Manjaro](src/installations/macos/manjaro)
* Set custom
  [macOS](src/preferences/macos) /
  [Manjaro](src/preferences/manjaro)
preferences

## Screenshots

### Git

#### Output for `git status`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/git-status-output-macos.png" alt="Output for git status on macOS" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/git-status-output-manjaro.png" alt="Output for git status on Manjaro" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
            <td>Manjaro</td>
        </td>
    </tbody>
</table>

#### Output for `git log`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/git-log-output-macos.png" alt="Output for git status on macOS" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/git-log-output-manjaro.png" alt="Output for git status on Manjaro" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
            <td>Manjaro</td>
        </td>
    </tbody>
</table>

### Tmux & Terminal

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/tmux-terminal-macos.png" alt="Output for git status on macOS" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/tmux-terminal-manjaro.png" alt="Output for git status on Manjaro" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
            <td>Manjaro</td>
        </td>
    </tbody>
</table>

### Emacs

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/emacs-macos.png" alt="Output for git status on macOS" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/emacs-manjaro.png" alt="Output for git status on Manjaro" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
            <td>Manjaro</td>
        </td>
    </tbody>
</table>

### Vim

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/vim-macos.png" alt="Output for git status on macOS" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/winkey728/dotfiles/master/screenshots/vim-manjaro.png" alt="Output for git status on Manjaro" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
            <td>Manjaro</td>
        </td>
    </tbody>
</table>

## Local Settings

Those additional local requirements can be put in the `.local` files.

### zsh (`~/.zsh.local`)

The `~/.zsh.local` file will be sourced after
`~/.zprofile` and `~/.zshrc`, thus, allowing
its content to add to or overwrite the
existing aliases, settings, PATH, etc.

### git (`~/.gitconfig.local`)

The `~/.gitconfig.local` file will be included
after the configurations from `~/.gitconfig**,
thus, allowing its content to overwrite or add
to the existing `git** configurations.

__Note:__ __Don't put sensitive information in `~/.gitconfig`,__
Use `~/.gitconfig.local` to store them, e.g.:

```bash
[commit]

    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    # gpgsign = true

[diff]

    # You can use any diff tool here(e.g. Meld)

    # tool = meld

[merge]

    # You can use any merge tool here(e.g. Meld)

    # tool = meld

[user]

    name = winkey
    email = winkey@example.com
    # signingkey =

[credential]

    helper = osxkeychain
```

## Update

To update the dotfiles you can either run the [`setup`
script](src/bootstrap/setup.sh) or, if you want to just
update one particular part, run the appropriate script.


## Acknowledgements

Inspiration and code was taken from many sources, including:

* [Cătălin Mariș'](https://github.com/alrra)
  [dotfiles](https://github.com/alrra/dotfiles)

* [Mathias Bynens'](https://github.com/mathiasbynens)
  [dotfiles](https://github.com/mathiasbynens/dotfiles)
