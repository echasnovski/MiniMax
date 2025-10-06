local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later

-- Tree-sitter (advanced syntax parsing, highlighting, textobjects) ===========
now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    checkout = 'main',
  })

  -- Ensure installed
  local ensure_installed = { 'lua', 'vimdoc' }
  local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 end
  local to_install = vim.tbl_filter(isnt_installed, ensure_installed)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Ensure enabled
  local filetypes = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  _G.Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- Language server configurations =============================================
now_if_args(function()
  add('neovim/nvim-lspconfig')
  -- vim.lsp.enable({
  --   -- List LSP servers to enable
  -- })
end)

-- Formatting =================================================================
later(function()
  add('stevearc/conform.nvim')
  require('conform').setup({
    -- Map of filetype to formatters
    formatters_by_ft = { lua = { 'stylua' } },
  })
end)

-- Snippet collection =========================================================
later(function() add('rafamadriz/friendly-snippets') end)

-- Honorable mentions:
-- - 'mason-org/mason.nvim'
