### MiniMax configs

Source for Neovim config examples. Description of available configs:

- [`nvim-0.9`](nvim-0.9) - for Neovim>=0.9
- [`nvim-0.10`](nvim-0.10) - for Neovim>=0.10
- [`nvim-0.11`](nvim-0.11) - for Neovim>=0.11
- [`nvim-0.12`](nvim-0.12) - for Neovim>=0.12

Each config has the following structure:

- `init.lua` - initial file that is executed first during startup.

- `plugin/` - directory of files that are automatically executed in alphabetical order during startup. Provide modular approach organizing config. Files:
    - `10_options.lua` - sets all built-in Neovim behavior.
    - `20_keymaps.lua` - creates custom mappings, mostly for the [`:h <Leader>`](https://neovim.io/doc/user/helptag.html?tag=<Leader>) key.
    - `30_mini.lua` - sets up 'mini.nvim' modules.
    - `40_plugins.lua` - sets up plugins outside of MINI.

  > [!NOTE]
  > Many configurations prefer to use 'lua/' directory with explicit `require()` calls to modularize their config. It is okay to use, but has a drawback that it occupies 'lua' namespace. As it is shared across all plugins, it might lead to conflicts during `require()`. Usually solved by having config files inside a dedicated "user" directory like 'lua/username'.
  >
  > The 'plugin/' approach doesn't have this issue. It also doesn't need explicit `require()` calls inside 'init.lua' for files to be executed.

  > [!TIP]
  > For more details about this approach, see [`:h load-plugins`](https://neovim.io/doc/user/helptag.html?tag=load-plugins). In particular:
  > - Subdirectories are allowed. Their files are also sourced in alphabetical order.
  > - 'plugin/' files still get executed if Neovim is started with `nvim -u path/to/file`. Make sure to also pass `--noplugin` or use [`:h $NVIM_APPNAME`](https://neovim.io/doc/user/helptag.html?tag=$NVIM_APPNAME) approach.

- `snippets/` - directory for user defined snippets. Contains a single 'global.json' file as a demo; it is used in the 'mini.snippets' setup.
