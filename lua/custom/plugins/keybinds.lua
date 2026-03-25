vim.keymap.set('n', '<leader>tn', '<cmd>set number!<cr>', { desc = '[T]oggle Line [N]umber' })
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = '[T]oggle Soft [W]rap' })
vim.keymap.set('n', '<leader>ts', '<cmd>windo set scrollbind!<cr>', { desc = '[T]oggle [s]crollbind' })
vim.keymap.set('n', '<leader>tl', function() vim.opt.cursorline = not vim.opt.cursorline:get() end, { desc = '[T]oggle cursor[l]ine' })
vim.keymap.set('n', '<leader>tc', function() vim.opt.spell = not vim.opt.spell:get() end, { desc = '[T]oggle Spell [C]hecking' })

vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -3<CR>', { desc = 'Resize split left' })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +3<CR>', { desc = 'Resize split right' })
vim.keymap.set('n', '<S-Up>', '<cmd>resize +3<CR>', { desc = 'Resize split taller' })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -3<CR>', { desc = 'Resize split shorter' })

return {}
