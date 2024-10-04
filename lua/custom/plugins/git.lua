return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })
      vim.keymap.set('n', '<leader>gh', '<cmd>0Gllog<cr>', { desc = 'File history' })
      vim.keymap.set('n', '<leader>gl', '<cmd>Gllog<cr>', { desc = 'Git log' })
    end,
  },
  { 'tpope/vim-rhubarb' },
}
