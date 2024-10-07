return {
  {
    'vim-test/vim-test',
    dependencies = {
      { 'preservim/vimux' },
    },
    keys = {
      { '<leader>rt', '<cmd>TestNearest<cr>', desc = 'Run the test nearest to the cursor' },
      { '<leader>rT', '<cmd>TestFile<cr>', desc = 'Run all tests in the file' },
      { '<leader>ra', '<cmd>TestSuite<cr>', desc = 'Run the whole test suite' },
      { '<leader>rl', '<cmd>TestLast<cr>', desc = 'Runs the last test' },
    },
    config = function()
      vim.cmd 'let test#strategy = "vimux"'
      vim.cmd [[
        function! PyTestActivateVenv(cmd) abort
          return 'source .venv/bin/activate.fish && ' . a:cmd
        endfunction
        let g:test#custom_transformations = {'pytest': function('PyTestActivateVenv')}
        let g:test#transformation = 'pytest'
      ]]
    end,
  },
}
