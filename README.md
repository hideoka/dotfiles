# dotfiles

Personal development environment configuration files for consistent setup across machines. This repository includes configurations for terminal, shell, editor, and various development tools.

## Supported Environments

- **macOS**: Latest versions (using Homebrew)
- **Linux**: Ubuntu/Debian-based distributions (using apt)

## Installation Requirements
- make
- git
- HackGen Console NF font
- alacritty
- neovim
- fzf
- rust
- Homebrew(macOS)

## Quick Start

```bash
$ git clone https://github.com/hideoka/dotfiles.git
$ cd dotfiles
$ make init
```

## Commands

### `make init`
Complete setup including package installation and symbolic link creation. Run this for first-time setup.

### `make deploy`
Creates symbolic links to dotfiles only. Use this when you want to update configurations without reinstalling packages.

### `make update`
Updates the repository to the latest version from remote.
