return {
  -- slime (REPL integration)
  -- c.f.: https://github.com/LazyVim/LazyVim/discussions/234#discussion-4845956
  {
    'jpalardy/vim-slime',
    keys = {
      { '<leader>rr', '<Plug>SlimeSendCell', desc = 'Slime Send Cell' },
    },
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_default_config = { socket_name = 'default', target_pane = '1' }
    end,
  },
}
