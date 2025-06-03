return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  event = 'VeryLazy',
  config = function()
    local M = {}
    M.theme = function()
      local colors = {
        darkgray = '#16161d',
        gray = '#908caa',
        innerbg = nil,
        outerbg = nil,
        normal = '#3e8fb0',
        insert = '#c4a7e7',
        visual = '#f6c177',
        replace = '#eb6f92',
        command = '#f6c177',
      }
      return {
        inactive = {
          a = { fg = colors.gray, bg = colors.outerbg, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        visual = {
          a = { fg = colors.darkgray, bg = colors.visual, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        replace = {
          a = { fg = colors.darkgray, bg = colors.replace, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        normal = {
          a = { fg = colors.darkgray, bg = colors.normal, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        insert = {
          a = { fg = colors.darkgray, bg = colors.insert, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
        command = {
          a = { fg = colors.darkgray, bg = colors.command, gui = 'bold' },
          b = { fg = colors.gray, bg = colors.outerbg },
          c = { fg = colors.gray, bg = colors.innerbg },
        },
      }
    end
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = M.theme(),
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { '' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
