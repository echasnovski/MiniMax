<p align="center"> <img src="logo.png" alt="mini.nvim" style="max-width:100%;border:solid 2px"/> </p>

THIS IS A WORK IN PROGRESS! BEFORE IT IS MOVED TO NVIM-MINI ORG, PLEASE DO NOT USE IT AND DO NOT CREATE ISSUES/PRS/DISCUSSIONS! THANK YOU!

## Neovim with maximum MINI

MiniMax is a collection of Neovim config examples. All of them:

- Use mostly MINI.
- Provide out of the box stable, polished, and feature rich Neovim experience.
- Share minimal structure with potential to build upon.
- Contain extensively commented config files meant to be read.

Browse available configs [here](configs). The most appropriate one will be automatically chosen during [full setup](#full).

See [change log](CHANGELOG.md) for a history of changes.

### What it is not

- A "Neovim distribution", i.e. there is no automatic config updates. After setting up config, it is yours to improve and update (which makes this approach more stable).

    You can still see how MiniMax itself gets updated (see [Update](#update) and [Change log](CHANGELOG.md)) and adjust the config accordingly.

- A comprehensive guide on how to set up and use every Neovim feature and plugin. The goals of the project are:

    - Provide an entry point for users to start using Neovim.
    - Serve as a demo of MINI capabilities.

### Requirements

#### Software

- Mandatory:
    - [Neovim](https://neovim.io/) executable. Will be referred here as `nvim`.
    - [Git](https://git-scm.com/). Will be referred here as `git`.
    - Operating system: any OS supported by Neovim.
    - Internet connection for downloading plugins.

- Optional (but recommended):
    - [`ripgrep`](https://github.com/BurntSushi/ripgrep#installation).
    - Terminal emulator or GUI with true colors and [Nerd Font icons](https://www.nerdfonts.com/) support. No need for full Nerd font, using `Symbols Only` nerd font as a fallback is usually enough.

#### Knowledge

Basic level of understanding how to:

- Use CLI (command line): open, navigate file system, execute commands, close.

- Use Neovim: open, modal editing, reading help, close. If inside Neovim, type [`:h help.txt`](https://neovim.io/doc/user/helptag.html?tag=help.txt) (or click it if it is a link) followed by `<Enter>` and it should guide you through understanding basics. Couple of personal recommendations (no ned to read in full; be aware of their content):
    - [`:h notation`](https://neovim.io/doc/user/helptag.html?tag=notation)
    - [`:h key-notation`](https://neovim.io/doc/user/helptag.html?tag=key-notation)
    - [`:h vim-modes`](https://neovim.io/doc/user/helptag.html?tag=vim-modes) and [`:h mode-switching`](https://neovim.io/doc/user/helptag.html?tag=mode-switching)
    - [`:h windows-intro`](https://neovim.io/doc/user/helptag.html?tag=windows-intro)

- Read help files from inside Neovim: notion of help tags, key notations, navigation.

  > [!TIP]
  > If already inside MiniMax config, press `<Space>` + `f` + `h` to fuzzy search across all help tags.

- Read [Lua language](https://learnxinyminutes.com/lua/): variables, tables, function calls, iterations. See also [`:h lua-concepts`](https://neovim.io/doc/user/helptag.html?tag=lua-concepts) and [`:h lua-guide`](https://neovim.io/doc/user/helptag.html?tag=lua-guide).

#### Personality

- Readiness to read documentation. At the beginning it might feel like a lot of reading. It gets easier the more you learn and practice.

    Without this you likely won't enjoy Neovim and MiniMax as much.

### Setting up

#### Full

- Download this project (here `./MiniMax` is used as a target path, i.e. download inside current directory as 'MiniMax'; can be other path):

    - Via `git clone`. For example:

        ```bash
        git clone --filter=blob:none https://github.com/nvim-mini/MiniMax ./MiniMax
        ```

    - Manually via GitHub UI.

- Run 'setup.lua' script (copies config files and possibly initiates Git repository):

    - For a full-time use. Sets up regular user's config directory. On Linux this sets up '~/.config/nvim'.

        ```bash
        nvim -l ./MiniMax/setup.lua
        ```


    - For a demo use. Doesn't affect your regular config as it uses a dedicated config directory. On Linux this sets up '~/.config/nvim-minimax'. See `:h $NVIM_APPNAME`.

        ```bash
        NVIM_APPNAME=nvim-minimax nvim -l ./MiniMax/setup.lua
        ```

  > [!NOTE]
  > If there are messages about backed up files during setup, it means target config directory already contained files that are meant to come from MiniMax. Previous files were moved to `MiniMax-backup` directory. Review/restore them and delete the whole backup directory.

- Start `nvim`:

    - After a full-time use config setup:

        ```bash
        nvim
        ```

    - After a demo use config setup. Start Neovim using `nvim-minimax` as config directory. Always set `NVIM_APPNAME` to use MiniMax installed this way.

        ```bash
        NVIM_APPNAME=nvim-minimax nvim
        ```

- Wait for all plugins to install (there should be no new notifications appearing).

- Read files of your new config. Start with 'init.lua' by typing `<Space>` + `e` + `i`.

- Enjoy!

#### Partial

- Explore [MiniMax configs](configs) to find which config example suits you best. Requires knowing your current Neovim version.

- Read through relevant config example (starting at 'init.lua') and use interesting parts in your already existing config.

### Updating

MiniMax doesn't provide fully automatic updates of already set up config. The recommended approach is to follow the [partial setup](#partial) path.

The closest approach to automatic update is:

- Download updates of MiniMax. Depending on how it itself is downloaded:

    - Run `git -C ./MiniMax pull` if you downloaded via `git clone`. Replace `./MiniMax` with the path to where you downloaded MiniMax.

    - Download the latest code manually via GitHub UI.

- Run 'setup.lua' script as was done during [full setup](#full). It will probably show messages about backed up files. Examine 'MiniMax-backup' directory that contains all conflicting files; recover the ones you need; delete the backup directory.

### Similar projects

- [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- More automated approaches ("Neovim distributions"):
    - [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)
    - [NvChad/NvChad](https://github.com/NvChad/NvChad)
    - [AstroNvim/AstroNvim](https://github.com/AstroNvim/AstroNvim)
