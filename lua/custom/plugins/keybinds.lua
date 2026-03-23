vim.keymap.set('n', '<leader>tn', '<cmd>set number!<cr>', { desc = '[T]oggle Line [N]umber' })
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<cr>', { desc = '[T]oggle Soft [W]rap' })
vim.keymap.set('n', '<leader>ts', '<cmd>windo set scrollbind!<cr>', { desc = '[T]oggle [s]crollbind' })
return {}
