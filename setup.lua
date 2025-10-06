-- Determine the correct MiniMax version (if any)
local version
if vim.fn.has('nvim-0.11') == 1 then version = 'nvim-0.11' end
if version == nil then
  print('There is no available MiniMax version. Try updating Neovim.\n')
  return
end

local script_dir = vim.fs.dirname((_G.arg or {})[0]) or vim.fn.getcwd()
local version_dir = script_dir .. '/configs/' .. version

-- Ensure proper config directory
local config_dir =
  vim.fn.fnamemodify(vim.fn.stdpath('config'), ':p'):gsub('[\\/]+$', '')
vim.fn.mkdir(config_dir, 'p')

local backup_dir = config_dir .. '/MiniMax-backup'
if vim.loop.fs_stat(backup_dir) ~= nil then
  print(
    'MiniMax backup directory is already present: '
      .. backup_dir
      .. '\nManage it first (go through it; preserve what is needed; delete it),'
      .. 'before attempting another installation\n'
  )
  return
end

-- Safely (no delete) copy to config directory. Backup conflicting files.
local backup
backup = function(rel_path)
  local from = config_dir .. '/' .. rel_path
  local to = backup_dir .. '/' .. rel_path
  if vim.loop.fs_stat(from) == nil then return end

  vim.fn.mkdir(vim.fs.dirname(to), 'p')
  if vim.fn.isdirectory(from) == 0 then
    vim.loop.fs_rename(from, to)
    print('Backed up:\n  ' .. from)
    return
  end

  for f, _ in vim.fs.dir(from) do
    backup(rel_path .. '/' .. f)
  end
  vim.loop.fs_rmdir(from) -- Remove already empty directory
end

local safely_copy
safely_copy = function(rel_path, skip_if_present)
  local from = version_dir .. '/' .. rel_path
  local to = config_dir .. '/' .. rel_path
  if skip_if_present and vim.loop.fs_stat(to) ~= nil then
    print('Skipped copy:\n  ' .. rel_path)
    return
  end

  backup(rel_path)

  vim.fn.mkdir(vim.fs.dirname(to), 'p')
  if vim.fn.isdirectory(from) == 0 then
    vim.loop.fs_copyfile(from, to)
    return
  end

  for f, _ in vim.fs.dir(from) do
    safely_copy(rel_path .. '/' .. f)
  end
end

safely_copy('init.lua')
safely_copy('plugin') -- Back up whole 'plugin/' directory to avoid config conflicts
safely_copy('after/ftplugin/markdown.lua', true) -- Prefer user's existing files
safely_copy('after/lsp/lua_ls.lua', true)
safely_copy('after/snippets/lua.json', true)
safely_copy('snippets/global.json', true)

-- Possibly Git init. It is a good practice and helps with root detection.
if vim.loop.fs_stat(config_dir .. '/.git') == nil then
  vim.fn.system({ 'git', '-C', config_dir, 'init' })
  vim.fn.system({ 'git', '-C', config_dir, 'add', '*' })
  vim.fn.system({ 'git', '-C', config_dir, 'commit', '-m', 'feat: set up MiniMax' })
end

print('Set up MiniMax config at ' .. config_dir)
