-- Getting started with the VimTeX plugin:
-- https://ejmastnak.com/tutorials/vim-latex/vimtex/

return {
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_view_method = 'skim'
    end,
  },
}
