return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: Add' })

      vim.keymap.set('n', '<leader>e', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: Open quick menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon: select 1' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon: select 2' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon: select 3' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon: select 4' })
    end,
  },
}