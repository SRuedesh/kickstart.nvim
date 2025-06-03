return {
  'ThePrimeagen/harpoon',
  config = function()
    require('harpoon').setup {}
    vim.keymap.set('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = 'Add [A] file to harpoon marks' })
    vim.keymap.set('n', '<leader>hq', "<cmd>lua require('harpoon.mark').clear_all()<CR>", { desc = 'Clear all [Q]uick marks' })
    vim.keymap.set('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = 'Navigate to [P]revious harpoon mark' })
    vim.keymap.set('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = 'Navigate to [N]ext harpoon mark' })
    vim.keymap.set('n', '<leader>hl', '<cmd>Telescope harpoon marks<CR>', { desc = 'List all harpoon [L]ocations' })

    vim.keymap.set('n', '<leader>hx', "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { desc = 'Jump to harpoon mark 1' })
    vim.keymap.set('n', '<leader>hc', "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { desc = 'Jump to harpoon mark 2' })
    vim.keymap.set('n', '<leader>hd', "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { desc = 'Jump to harpoon mark 3' })
    vim.keymap.set('n', '<leader>hr', "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { desc = 'Jump to harpoon mark 4' })
    vim.keymap.set('n', '<leader>hs', "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", { desc = 'Jump to harpoon mark 5' })
    vim.keymap.set('n', '<leader>ht', "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", { desc = 'Jump to harpoon mark 6' })
  end,
}
