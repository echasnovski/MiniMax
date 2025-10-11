## MiniMax configs

Available:

- [`nvim-0.11`](nvim-0.11) - for Neovim>=0.11

Planned (after small time of 'nvim-0.11' public testing):

- [`nvim-0.9`](nvim-0.9) - for Neovim>=0.9
- [`nvim-0.10`](nvim-0.10) - for Neovim>=0.10
- [`nvim-0.12`](nvim-0.12) - for Neovim>=0.12

### Structure

#### `init.lua`

Initial file executed first during startup.

#### `plugin/`

Files automatically executed in alphabetical order during startup:

- `10_options.lua` - built-in Neovim behavior.
- `20_keymaps.lua` - custom mappings, mostly for the [`:h <Leader>`](https://neovim.io/doc/user/helptag.html?tag=<Leader>) key.
- `30_mini.lua` - MINI configuration.
- `40_plugins.lua` - plugins outside of MINI.

> [!NOTE]
> Many configurations prefer to use the 'lua/' directory with explicit `require()` calls to modularize their config. It is okay to use, but has a drawback that it occupies 'lua' namespace. As it is shared across all plugins, it might lead to conflicts during `require()`. Usually solved by having config files inside a dedicated "user" directory like 'lua/username'.
>
> The 'plugin/' approach doesn't have this issue. It also doesn't need explicit `require()` calls inside 'init.lua' for files to be executed.

> [!TIP]
> For more details about this approach, see [`:h load-plugins`](https://neovim.io/doc/user/helptag.html?tag=load-plugins). In particular:
> - Subdirectories are allowed. Their files are also sourced in alphabetical order.
> - 'plugin/' files still get executed if Neovim is started with `nvim -u path/to/file`. Make sure to also pass `--noplugin` or use [`:h $NVIM_APPNAME`](https://neovim.io/doc/user/helptag.html?tag=$NVIM_APPNAME) approach.

#### `snippets/`

User defined snippets. Contains a single 'global.json' file as a demo (used in the 'mini.snippets' setup).

#### `after/`

Files for overriding behavior added by plugins. Usually located inside special subdirectories like 'ftplugin/' (see [`:h 'runtimepath'`](https://neovim.io/doc/user/helptag.html?tag='runtimepath')). Files from this directory take effect after similar files provided by plugins.

For demonstration purposes, it contains examples for two common ways to use 'after/':

- `ftplugin/` - filetype plugins. Contains files that are sourced when [`:h 'filetype'`](https://neovim.io/doc/user/helptag.html?tag='filetype') option is set.

    For example, '\*.txt' files have `text` filetype, so 'ftplugin/text.lua' is sourced when '\*.txt' file is opened. It defines behavior that should exist only in `text` files.

- `lsp/` (on Neovim>=0.11) - files that configure LSP servers. These are used by Neovim's built-in [`:h vim.lsp.config()`](https://neovim.io/doc/user/helptag.html?tag=vim.lsp.config()) and [`:h vim.lsp.enable()`](https://neovim.io/doc/user/helptag.html?tag=vim.lsp.enable()). See also [`:h lsp-quickstart`](https://neovim.io/doc/user/helptag.html?tag=lsp-quickstart) for more details.

    For example, the 'lsp/lua_ls.lua' file defines part of configuration that will be used during `vim.lsp.enable({ 'lua_ls' })` (i.e. with the same name).

- `snippets/` - files containing snippet definition per language. Used by ['mini.snippets'](https://nvim-mini.org/mini.nvim/doc/mini-snippets.html). As they are located in 'after/', they override any snippets provided by plugins (like 'rafamadriz/friendly-snippets').

    For example, based on 'snippets/lua.json', typing `l` + `<C-j>` in Insert mode inside Lua files will always insert `local $1 = $0` snippet. No matter if any other snippet provider contains this or conflicting snippet.

Other useful directories are:

- `queries/` - custom [tree-sitter queries](https://neovim.io/doc/user/helptag.html?tag=treesitter-query).
- `keymap/` - custom ['keymap'](https://neovim.io/doc/user/helptag.html?tag=mbyte-keymap)
