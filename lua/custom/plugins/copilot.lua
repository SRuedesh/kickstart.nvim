return {
  'github/copilot.vim',
  config = function()
    --   require('copilot.vim').setup {}
    vim.keymap.set('n', '<leader>iy', '<Plug>(copilot-accept-line)', { desc = 'Cop[i]lot ([y]es) accept' })
    vim.keymap.set('n', '<leader>id', '<Plug>(copilot-dismiss)', { desc = 'Cop[i]lot [d]ismiss' })
    vim.keymap.set('n', '<leader>ip', '<Plug>(copilot-previous)', { desc = 'Cop[i]lot [p]revious' })
    vim.keymap.set('n', '<leader>in', '<Plug>(copilot-next)', { desc = 'Cop[i]lot [n]ext' })
    vim.keymap.set('n', '<leader>is', '<Plug>(copilot-suggest)', { desc = 'Cop[i]lot [s]uggest' })

    local copilot_on
    vim.api.nvim_create_user_command('CopilotToggle', function()
      if copilot_on then
        vim.cmd 'Copilot disable'
        print 'Copilot OFF'
      else
        vim.cmd 'Copilot enable'
        print 'Copilot ON'
      end
      copilot_on = not copilot_on
    end, { nargs = 0 })
    vim.keymap.set('', '<leader>it', ':CopilotToggle<CR>', { noremap = true, silent = true })
  end,
}
