vim.keymap.set('n', '<leader>tn', '<cmd>set number!<cr>', { desc = '[T]oggle Line [N]umber' })
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = '[T]oggle Soft [W]rap' })
vim.keymap.set('n', '<leader>ts', '<cmd>windo set scrollbind!<cr>', { desc = '[T]oggle [s]crollbind' })
vim.keymap.set('n', '<leader>tl', function() vim.opt.cursorline = not vim.opt.cursorline:get() end, { desc = '[T]oggle cursor[l]ine' })
vim.keymap.set('n', '<leader>tc', function() vim.opt.spell = not vim.opt.spell:get() end, { desc = '[T]oggle Spell [C]hecking' })

vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -3<CR>', { desc = 'Resize split left' })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +3<CR>', { desc = 'Resize split right' })
vim.keymap.set('n', '<S-Up>', '<cmd>resize +3<CR>', { desc = 'Resize split taller' })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -3<CR>', { desc = 'Resize split shorter' })

local my_find_files
my_find_files = function(opts, no_ignore)
  opts = opts or {}
  no_ignore = vim.F.if_nil(no_ignore, false)
  opts.attach_mappings = function(_, map)
    map({ 'n', 'i' }, '<C-h>', function(prompt_bufnr) -- <C-h> to toggle modes
      local prompt = require('telescope.actions.state').get_current_line()
      require('telescope.actions').close(prompt_bufnr)
      no_ignore = not no_ignore
      my_find_files({ default_text = prompt }, no_ignore)
    end)
    return true
  end

  if no_ignore then
    opts.no_ignore = true
    opts.hidden = true
    opts.prompt_title = 'Find Files <ALL>'
    require('telescope.builtin').find_files(opts)
  else
    opts.prompt_title = 'Find Files'
    require('telescope.builtin').find_files(opts)
  end
end

vim.keymap.set('n', '<leader>sf', my_find_files, { desc = '[S]earch [A]ll files' }) -- you can then bind this to whatever you want

return {}
