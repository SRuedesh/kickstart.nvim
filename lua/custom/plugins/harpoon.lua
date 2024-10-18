return {
  'ThePrimeagen/harpoon',
  config = function()
    require('harpoon').setup {}
    vim.keymap.set('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = 'Add [A] file to harpoon marks' })
    vim.keymap.set('n', '<leader>hq', "<cmd>lua require('harpoon.mark').clear_all()<CR>", { desc = 'Clear all [Q]uick marks' })
    vim.keymap.set('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = 'Navigate to [P]revious harpoon mark' })
    vim.keymap.set('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = 'Navigate to [N]ext harpoon mark' })
    vim.keymap.set('n', '<leader>hl', '<cmd>Telescope harpoon marks<CR>', { desc = 'List all harpoon [L]ocations' })
  end,
}
