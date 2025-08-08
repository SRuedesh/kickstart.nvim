return {
  {
    'xiyaowong/transparent.nvim',
    event = 'VeryLazy',
    config = function()
      require('transparent').setup {
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
          'Normal',
          'NormalNC',
          'Comment',
          'Constant',
          'Special',
          'Identifier',
          'Statement',
          'PreProc',
          'Type',
          'Underlined',
          'Todo',
          'String',
          'Function',
          'Conditional',
          'Repeat',
          'Operator',
          'Structure',
          'LineNr',
          'NonText',
          'SignColumn',
          'CursorLine',
          'CursorLineNr',
          'StatusLine',
          'StatusLineNC',
          'EndOfBuffer',
        },
        exclude = {}, -- table: groups you don't want to clear
      }
    end,
  },
}
