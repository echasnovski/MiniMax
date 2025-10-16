<p align="center"> <img src="logo.png" alt="mini.nvim" style="max-width:100%;border:solid 2px"/> </p>

## Neovim with maximum MINI

MiniMax is a collection of fully working self-contained Neovim configs. All of the them:

- Use mostly MINI to showcase its capabilities.
- Provide out of the box a stable, polished, and feature rich Neovim experience.
- Share minimal structure with potential to build upon.
- Contain extensively commented config files meant to be read.

It can be automatically [set up](#setting-up), which uses the best suited config from [available ones](configs).

See [change log](CHANGELOG.md) for a history of changes.

If you find this project useful, please consider leaving a Github star.

### How it looks

<a href="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_1.png?raw=true"> <img alt="During setup" src="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_1.png?raw=true" style="width: 45%"/> </a>
<a href="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_2.png?raw=true"> <img alt="Picker" src="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_2.png?raw=true" style="width: 45%"/> </a>

<a href="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_3.png?raw=true"> <img alt="Clues" src="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_3.png?raw=true" style="width: 45%"/> </a>
<a href="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_4.png?raw=true"> <img alt="File explorer" src="https://github.com/nvim-mini/assets/blob/main/demo/demo-minimax_4.png?raw=true" style="width: 45%"/> </a>

### What it is not

It is not a "Neovim distribution", i.e. there are no automatic config updates. After your config is set up, it is yours to improve and update (which makes this approach more stable). You can still see how MiniMax itself gets updated (see [Updating](#updating) and [Change log](CHANGELOG.md)) and adjust the config accordingly.

It is not a comprehensive guide on how to set up and use every Neovim feature and plugin. Most of the config parts are carefully chosen in order to reach a balance between stability and features.

### Requirements

#### Software

- [Neovim](https://neovim.io/) executable. Assumed to be named `nvim`.
- [Git](https://git-scm.com/) executable. Assumed to be named `git`.
- Operating system: any OS supported by Neovim.
- Internet connection for downloading plugins.
- (Optional, but recommended) [`ripgrep`](https://github.com/BurntSushi/ripgrep#installation).
- (Optional, but recommended) Terminal emulator (or GUI) with [true colors](https://github.com/termstandard/colors#truecolor-support-in-output-devices) and [Nerd Font icons](https://www.nerdfonts.com/) support. No need for a full Nerd font, using [`NerdFontsSymbolsOnly`](https://github.com/ryanoasis/nerd-fonts/releases/latest) as a fallback is usually enough.

#### Knowledge

Basic level of understanding of how to:

- Use CLI (command line): open, navigate file system, execute commands, close.

- Use Neovim: open, modal editing, reading help, close. If inside Neovim, type [`:h help.txt`](https://neovim.io/doc/user/helptag.html?tag=help.txt) (or click it if it is a link) followed by `<Enter>` and it should guide you through understanding basics.

    Several personal recommendations (no need to read in full; be aware of their content): [`:h notation`](https://neovim.io/doc/user/helptag.html?tag=notation), [`:h key-notation`](https://neovim.io/doc/user/helptag.html?tag=key-notation), [`:h vim-modes`](https://neovim.io/doc/user/helptag.html?tag=vim-modes), [`:h mode-switching`](https://neovim.io/doc/user/helptag.html?tag=mode-switching), [`:h windows-intro`](https://neovim.io/doc/user/helptag.html?tag=windows-intro),  [`:h vimtutor`](https://neovim.io/doc/user/helptag.html?tag=vimtutor)

- Read help files from inside Neovim: notion of help tags, key notations, navigation.

  > [!TIP]
  > If already inside MiniMax config, press `<Space>` + `f` + `h` to fuzzy search across all help tags.

- Read [Lua language](https://learnxinyminutes.com/lua/): variables, tables, function calls, iterations. See also [`:h lua-concepts`](https://neovim.io/doc/user/helptag.html?tag=lua-concepts) and [`:h lua-guide`](https://neovim.io/doc/user/helptag.html?tag=lua-guide).

#### Motivation

- It will be really helpful if you are mentally ready to read documentation and practice. If you are new to Neovim and/or MINI, it might feel like a lot. It gets easier the more you learn and practice. Without this you likely won't enjoy Neovim and MiniMax as much.

### Setting up

This sets up temporary 'nvim-minimax' config and doesn't affect your regular config. To set up a full time config, remove all instances of `NVIM_APPNAME=nvim-minimax`.

```bash
# Download
git clone --filter=blob:none https://github.com/nvim-mini/MiniMax ./MiniMax

# Set up config (copies config files and possibly initiates Git repository)
NVIM_APPNAME=nvim-minimax nvim -l ./MiniMax/setup.lua

# Start Neovim
NVIM_APPNAME=nvim-minimax nvim

# Wait for plugins to install (there should be no new notifications)

# Enjoy your new config!
# Start with reading its files (type `<Space>`+`e`+`i`, without much delay in between)
```

Notes:

- MiniMax project can be downloaded manually (like via GitHub UI).

- With `NVIM_APPNAME=nvim-minimax` config directory is '\~/.config/nvim-minimax' on Unix and '\~/AppData/Local/nvim-minimax' on Windows.

    A full-time config directory is '\~/.config/nvim' on Unix and '\~/AppData/Local/nvim' on Windows.

- If there are messages about backed up files during setup, it means the target config directory already contained files that are meant to come from MiniMax. Previous files were moved to `MiniMax-backup` directory. Review/restore them and delete the whole backup directory.

- You can explore [MiniMax](configs) manually to find which (parts of) config examples suit you best. Read through the relevant config example (starting at 'init.lua') and use interesting parts in your already existing config.

### Updating

MiniMax doesn't provide fully automatic updates of an already set up config. The recommended approach is to manually explore [configs](configs) and [change log](CHANGELOG.md) to see the changes.

The closest approach to automatic updating is:

```bash
# Pull updates of MiniMax itself
git -C ./MiniMax pull

# Run setup script again. Remove `NVIM_APPNAME=nvim-minimax` for full-time config
NVIM_APPNAME=nvim-minimax nvim -l ./MiniMax/setup.lua

# There probably be messages about backed up files:
# 1. Examine 'MiniMax-backup' directory with conflicting files.
# 2. Recover the ones you need.
# 3. Delete the backup directory.
```

### Similar projects

- [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

- More automated approaches ("Neovim distributions"):
    - [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)
    - [NvChad/NvChad](https://github.com/NvChad/NvChad)
    - [AstroNvim/AstroNvim](https://github.com/AstroNvim/AstroNvim)
