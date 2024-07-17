return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'dhruvasagar/vim-table-mode',
    keys = {
      { '<leader>tm', '<Plug>TableModeToggle', desc = 'Table: toggle on the fly mode' },
    },
  },
}
