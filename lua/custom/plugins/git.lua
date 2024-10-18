return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })
      vim.keymap.set('n', '<leader>gh', '<cmd>0Gllog<cr>', { desc = 'File history' })
      vim.keymap.set('n', '<leader>gl', '<cmd>Gllog<cr>', { desc = 'Git log' })

      vim.keymap.set('n', 'gh', '<cmd>diffget //2<cr>', { desc = 'Grab changes on the left' })
      vim.keymap.set('n', 'gl', '<cmd>diffget //3<cr>', { desc = 'Grab changes on the right' })
    end,
  },
  { 'tpope/vim-rhubarb' },
}
