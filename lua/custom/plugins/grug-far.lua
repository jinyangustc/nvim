return {
  {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    keys = {
      {
        '<leader>ug',
        function()
          require('grug-far').open {
            transient = true,
          }
        end,
        mode = 'n',
        desc = 'gr[ug]-far: Transient search',
      },
      {
        '<leader>ui',
        function()
          require('grug-far').open {
            visualSelectionUsage = 'operate-within-range',
          }
        end,
        mode = { 'n', 'x' },
        desc = 'gr[u]g-far: Search with[i]n range',
      },
      {
        '<leader>uw',
        function()
          require('grug-far').open {
            prefills = {
              search = vim.fn.expand '<cword>',
            },
          }
        end,
        mode = 'n',
        desc = 'gr[u]g-far: Search current [w]ord',
      },
    },

    config = function()
      -- optional setup call to override plugin options
      -- alternatively you can set options with vim.g.grug_far = { ... }
      require('grug-far').setup {
        -- options, see Configuration section below
        -- there are no required options atm
      }
    end,
  },
}
