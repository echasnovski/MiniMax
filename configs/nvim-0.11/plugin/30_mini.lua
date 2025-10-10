-- The `require('mini.xxx').setup()` is a common convention in 'mini.nvim' to
-- enable a module. See `:h mini.nvim-general-principles` for more principles.
local now, later = MiniDeps.now, MiniDeps.later

-- Step one ===================================================================
now(function() vim.cmd('colorscheme miniwinter') end)

now(function()
  require('mini.basics').setup({
    -- Manage options manually in a spirit of transparency
    options = { basic = false },
    mappings = { windows = true, move_with_alt = true },
    autocommands = { relnum_in_visual_mode = true },
  })
end)

now(function()
  local ext3_blocklist = { scm = true, txt = true, yml = true }
  local ext4_blocklist = { json = true, yaml = true }
  require('mini.icons').setup({
    use_file_extension = function(ext, _)
      -- Do not prefer extension-based icon for some extensions
      return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
    end,
  })

  later(MiniIcons.mock_nvim_web_devicons)
  later(MiniIcons.tweak_lsp_kind)
end)

now(function() require('mini.notify').setup() end)

now(function() require('mini.sessions').setup() end)

now(function() require('mini.starter').setup() end)

now(function() require('mini.statusline').setup() end)

now(function() require('mini.tabline').setup() end)

-- Step two ===================================================================
later(function() require('mini.extra').setup() end)

later(function()
  local ai = require('mini.ai')
  ai.setup({
    custom_textobjects = {
      B = MiniExtra.gen_ai_spec.buffer(),
      F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },
    search_method = 'cover',
  })
end)

later(function() require('mini.align').setup() end)

-- later(function() require('mini.animate').setup() end)

later(function() require('mini.bracketed').setup() end)

later(function() require('mini.bufremove').setup() end)

later(function()
  local miniclue = require('mini.clue')
  --stylua: ignore
  miniclue.setup({
    clues = {
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    triggers = {
      { mode = 'n', keys = '<Leader>' }, -- Leader triggers
      { mode = 'x', keys = '<Leader>' },
      { mode = 'n', keys = '\\' },       -- mini.basics
      { mode = 'n', keys = '[' },        -- mini.bracketed
      { mode = 'n', keys = ']' },
      { mode = 'x', keys = '[' },
      { mode = 'x', keys = ']' },
      { mode = 'i', keys = '<C-x>' },    -- Built-in completion
      { mode = 'n', keys = 'g' },        -- `g` key
      { mode = 'x', keys = 'g' },
      { mode = 'n', keys = "'" },        -- Marks
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },
      { mode = 'n', keys = '"' },        -- Registers
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },
      { mode = 'n', keys = '<C-w>' },    -- Window commands
      { mode = 'n', keys = 'z' },        -- `z` key
      { mode = 'x', keys = 'z' },
    },
  })

  -- Ensure 'mini.clue' works on the initial 'mini.starter' buffer
  if vim.bo.filetype == 'ministarter' then MiniClue.ensure_buf_triggers() end
end)

later(function() require('mini.comment').setup() end)

later(function()
  -- Don't show 'Text' suggestions and show snippets last
  local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
  end
  require('mini.completion').setup({
    lsp_completion = {
      source_func = 'omnifunc',
      auto_setup = false,
      process_items = process_items,
    },
  })

  -- Set up LSP part of completion
  local on_attach = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
  _G.Config.new_autocmd('LspAttach', nil, on_attach, "Set 'omnifunc'")

  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

-- later(function() require('mini.cursorword').setup() end)

later(function() require('mini.diff').setup() end)

later(function()
  -- Enable directory/file preview
  require('mini.files').setup({ windows = { preview = true } })

  local add_marks = function()
    MiniFiles.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Config' })
    local minideps_plugins = vim.fn.stdpath('data') .. '/site/pack/deps/opt'
    MiniFiles.set_bookmark('p', minideps_plugins, { desc = 'Plugins' })
    MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
  end
  _G.Config.new_autocmd('User', 'MiniFilesExplorerOpen', add_marks, 'Add bookmarks')
end)

later(function() require('mini.git').setup() end)

later(function()
  local hipatterns = require('mini.hipatterns')
  local hi_words = MiniExtra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
      todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
      note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

later(function() require('mini.indentscope').setup() end)

later(function() require('mini.jump').setup() end)

later(function() require('mini.jump2d').setup() end)

later(function()
  local map_multistep = require('mini.keymap').map_multistep
  map_multistep('i', '<Tab>', { 'pmenu_next' })
  map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
  map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  map_multistep('i', '<BS>', { 'minipairs_bs' })
end)

later(function()
  -- NOTE: Might be slow on very big buffers (10000+ lines)
  local map = require('mini.map')
  map.setup({
    symbols = { encode = map.gen_encode_symbols.dot('4x2') },
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.diff(),
      map.gen_integration.diagnostic(),
    },
  })

  for _, key in ipairs({ 'n', 'N', '*', '#' }) do
    local rhs = key
      .. 'zv'
      .. '<Cmd>lua MiniMap.refresh({}, { lines = false, scrollbar = false })<CR>'
    vim.keymap.set('n', key, rhs)
  end
end)

later(function()
  require('mini.misc').setup()
  MiniMisc.setup_auto_root()
  MiniMisc.setup_restore_cursor()
  MiniMisc.setup_termbg_sync()
end)

later(function() require('mini.move').setup() end)

later(function()
  require('mini.operators').setup()

  -- Create mappings for swapping adjacent arguments. Notes:
  -- - Relies on `a` argument textobject from 'mini.ai'.
  -- - It is not 100% reliable, but mostly works.
  -- - It overrides `:h (` and `:h )`.
  -- Explanation: `gx`-`ia`-`gx`-`ila` <=> exchange current and last argument
  -- Usage: when on `a` in `(aa, bb)` press `)` followed by `(`.
  vim.keymap.set('n', '(', '<Cmd>normal gxiagxila<CR>', { desc = 'Swap arg left' })
  vim.keymap.set('n', ')', '<Cmd>normal gxiagxina<CR>', { desc = 'Swap arg right' })
end)

later(function() require('mini.pairs').setup({ modes = { command = true } }) end)

later(function() require('mini.pick').setup() end)

later(function()
  local latex_patterns = { 'latex/**/*.json', '**/latex.json' }
  local lang_patterns = {
    tex = latex_patterns,
    plaintex = latex_patterns,
    -- Recognize special injected language of markdown tree-sitter parser
    markdown_inline = { 'markdown.json' },
  }

  local snippets = require('mini.snippets')
  local config_path = vim.fn.stdpath('config')
  snippets.setup({
    snippets = {
      snippets.gen_loader.from_file(config_path .. '/snippets/global.json'),
      snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
    },
  })

  -- MiniSnippets.start_lsp_server()
end)

later(function() require('mini.splitjoin').setup() end)

later(function() require('mini.surround').setup() end)

later(function() require('mini.trailspace').setup() end)

later(function() require('mini.visits').setup() end)

-- Not mentioned here, but can be useful:
-- - 'mini.colors' - don't really need it on daily basis.
-- - 'mini.doc' - needed only for plugin developers.
-- - 'mini.fuzzy' - don't really need it on daily basis.
-- - 'mini.test' - needed only for plugin developers.
