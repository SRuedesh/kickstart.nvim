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
      notes_subdir = '98_unordered',
      new_notes_location = 'notes_subdir',
      daily_notes = {
        folder = '00_daily',
        template = '94_templates/daily.md',
      },
      templates = {
        folder = '94_templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
      },
      -- allow :ObsidianFollowLink to follow links to external urls
      ----@param url string
      follow_url_func = function(url)
        vim.ui.open(url)
      end,
      disable_frontmatter = false, -- Enable for new notes, disable for templates
      ui = {
        enable = false,
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
        },
      },
      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
      -- Remove toggle checkbox mapping on enter
      -- mappings = {
      --   toggle_checkbox = '',
      -- },
      vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianTags<CR>', { desc = '[O]bsidian [T]ags' }),
      vim.keymap.set('n', '<leader>od', '<cmd>ObsidianDailies<CR>', { desc = '[O]bsidian [D]ailies' }),
      vim.keymap.set('n', '<leader>oc', '<cmd>ObsidianToggleCheckbox<CR>', { desc = '[O]bsidian [C]heckbox' }),
      vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = '[O]bsidian [N]ew note' }),
      vim.keymap.set('n', '<leader>oe', '<cmd>ObsidianTemplate<CR>', { desc = '[O]bsidian T[e]mplate' }),
      vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = '[O]bsidian [B]acklinks' }),
      vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = '[O]bsidian [L]inks' }),
      vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian [O]pen GUI' }),
      vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = '[O]bsidian [S]earch' }),
      vim.keymap.set('n', '<leader>of', '<cmd>ObsidianFollowLink<CR>', { desc = '[O]bsidian [F]ollow link' }),
      vim.keymap.set('n', '<CR>', '<Nop>'), -- Disable default enter mapping
      vim.keymap.set('n', '<leader><CR>', '<cmd>ObsidianToggleCheckbox<CR>', { desc = '[C]heckbox toggle' }),
    }
    require('obsidian').setup(opts)
  end,
}
