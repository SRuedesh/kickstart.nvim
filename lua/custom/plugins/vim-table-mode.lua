return {
  'dhruvasagar/vim-table-mode',
  event = 'VimEnter',
  config = function()
    vim.keymap.set('n', '<leader>tme', '<cmd>TableModeEnable<CR>', { desc = '[T]able [M]ode [E]nable' })
    vim.keymap.set('n', '<leader>tmd', '<cmd>TableModeDisable<CR>', { desc = '[T]able [M]ode [D]isable' })
  end,
}
