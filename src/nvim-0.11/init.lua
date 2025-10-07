-- Notes:
-- - Recommended to read inside Neovim instance running this config.


-- Bootstrap 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local mini_path = vim.fn.stdpath('data') .. '/site/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/nvim-mini/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' immediately to have its `now()` and `later()` helpers
require('mini.deps').setup()

-- Define main config table to be able to pass data between scripts
_G.Config = {}

-- Define custom autocommand group
_G.Config.augroup = vim.api.nvim_create_augroup('custom-config', {})
_G.Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = _G.Config.augroup, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end
