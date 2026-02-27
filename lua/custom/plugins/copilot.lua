return {
  {
    'github/copilot.vim',
    config = function()
      -- Disable default <Tab> mapping
      vim.g.copilot_no_tab_map = true

      -- Custom accept mapping
      vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })

      -- Disable Copilot for specific filetypes
      vim.g.copilot_filetypes = {
        ['grug-far'] = false,
        ['grug-far-history'] = false,
        ['grug-far-help'] = false,
      }
    end,
  },
}
