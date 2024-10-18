return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    -- Create a table with the options to be passed to setup()
    local opts = {
      workspaces = {
        { name = 'personal', path = '~/one_drive/github/obsidian' },
      },
      -- Set the default workspace
      notes_subdir = 'notes',
      new_notes_location = 'notes_subdir',
      daily_notes = {
        folder = 'notes/daily',
        template = 'templates/daily.md',
      },
      templates = {
        folder = 'templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },
      disable_frontmatter = false, -- Enable for new notes, disable for templates
      ui = {
        enable = true,
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
        },
      },
      vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTags<CR>', { desc = '[O]bsidian [T]ags' }),
      vim.keymap.set('n', '<leader>od', '<cmd>ObsidianDailies<CR>', { desc = '[O]bsidian [D]ailies' }),
      vim.keymap.set('n', '<leader>oc', '<cmd>ObsidianToggleCheckbox<CR>', { desc = '[O]bsidian [C]heckbox' }),
      vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[O]bsidian [N]ew note' }),
      vim.keymap.set('n', '<leader>oe', '<cmd>ObsidianTemplate<CR>', { desc = '[O]bsidian T[e]mplate' }),
      vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = '[O]bsidian [B]acklinks' }),
      vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = '[O]bsidian [L]inks' }),
      vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian [O]pen GUI' }),
      vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = '[O]bsidian [S]earch' }),
    }
    require('obsidian').setup(opts)
  end,
}
