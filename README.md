<p align="center"> <img src="logo.png" alt="mini.nvim" style="max-width:100%;border:solid 2px"/> </p>

THIS IS A WORK IN PROGRESS! BEFORE IT IS MOVED TO NVIM-MINI ORG, PLEASE DO NOT USE IT AND DO NOT CREATE ISSUES/PRS/DISCUSSIONS! THANK YOU!

### Build Neovim config with maximum MINI

A collection of Neovim config examples. All of them:

- Provide stable and polished Neovim experience enough for advanced daily driving of text/code editing.
- Share same minimal structure with potential to build upon.
- Utilize MINI tools to their maximum.

TODO:
- Not a distro.
- Read config files to get better understanding.

## Requirements

- Software:
    - Mandatory:
        - [Neovim](https://neovim.io/) executable. Will be referred here as `nvim`.
        - [Git](https://git-scm.com/). Will be referred here as `git`.
        - Operating system: any OS supported by Neovim.
        - Internet connection for downloading plugins.
    - Optional (but recommended):
        - [`ripgrep`](https://github.com/BurntSushi/ripgrep).
        - Terminal emulator or GUI with true colors and [Nerd Font icons](https://www.nerdfonts.com/) support. No need for full Nerd font, using `Symbols Only` nerd font as a fallback should be enough.

- Knowledge:
    - ...

- Personality:
    - ...

## Install

### Full (recommended)

- Download this project (here `~/MiniMax` is used as a target path; can be other path):

    - Via Git:

        ```bash
        git clone --filter=blob:none https://github.com/nvim-mini/MiniMax ~/MiniMax
        ```

    - Manually via GitHub UI.

- Run 'install.lua' script using version of `nvim` that you'll be using with MiniMax:

    - For full-time use (installs into user's regular config directory):

        ```bash
        nvim -l ~/MiniMax/install.lua
        ```

    - For a temporary demo use (installs into [`$NVIM_APPNAME`](https://neovim.io/doc/user/starting.html#_nvim_appname) config directory):

        ```bash
        NVIM_APPNAME=nvim-minimax nvim -l ~/MiniMax/install.lua
        ```

- Start Neovim: `nvim` after a full-time install and `NVIM_APPNAME=nvim-minimax nvim` for temporary install.

- Wait for all plugins to install (there should be no new notifications appearing).

- Enjoy!

### Partial

- Explore [src/README.md](src/README.md) to find which config example suits you best. Requires knowing your current Neovim version.

- Read through relevant config example (starting at 'init.lua') and use interesting parts in your config.

## Update

...

## Troubleshooting

- Messages during `nvim -l ~/MiniMax/install.lua`
