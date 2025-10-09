-- ┌──────────────────┐
-- │Welcome to MiniMax│
-- └──────────────────┘
--
-- This is a config designed to mostly use MINI. It provides out of the box
-- stable, polished, and feature rich Neovim experience. Its structure:
--
-- ├ 'init.lua'          Initial (this) file executed during startup
-- ├ 'plugin/'           Files automatically sourced during startup
-- ├── '10_options.lua'  Built-in Neovim behavior
-- ├── '20_keymaps.lua'  Custom mappings
-- ├── '30_mini.lua'     MINI configuration.
-- ├── '40_plugins.lua'  Plugins outside of MINI
-- ├ 'snippets/'         User defined snippets. Contains demo file.
-- ├ 'after/'            Files to override behavior added by plugins
-- ├── 'ftplugin/'       Files to set per filetype behavior. Contains demo file.
-- ├── 'snippets/'       Higher priority snippets. Contains demo file.
--
-- Config files are meant to be read, preferably inside Neovim instance running
-- this config and opened at its root. This helps better understand your setup.
-- Start with this file. Follow navigation advice at end of file.
--
-- There are throughout this kind of documentation comments. Common conventions:
--
-- - "Type `<Space>fh`" means "press <Space>, followed by f, followed by h".
-- - `:h xxx` means "documentation of helptag xxx". Either type text directly
--   followed by Enter or type `<Space>fh` to open a helptag fuzzy picker.
-- - See `:h key-notation` for key notation used.

-- Bootstrap 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local mini_path = vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local origin = 'https://github.com/nvim-mini/mini.nvim'
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', origin, mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' immediately to have its `now()` and `later()` helpers
require('mini.deps').setup()

-- Define main config table to be able to pass data between scripts
_G.Config = {}

-- Define custom autocommand group and helper to create an autocommand
-- Sources:
-- - `:h autocommand`
-- - `:h nvim_create_augroup()`
-- - `:h nvim_create_autocmd()`
local gr = vim.api.nvim_create_augroup('custom-config', {})
_G.Config.aurgroup = gr
_G.Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Next file: plugin/10_options.lua
