local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

return {
  s(
    'equ',
    fmt(
      [[
      \begin{equation}<>
      \end{equation}
      ]],
      { i(1) },
      { delimiters = '<>' }
    )
  ),
  s(
    'equ*',
    fmt(
      [[
      \begin{equation*}<>
      \end{equation*}
      ]],
      { i(1) },
      { delimiters = '<>' }
    )
  ),
  s(
    'item',
    fmt(
      [[
      \begin{itemize}
        \item <>
      \end{itemize}
      ]],
      { i(1) },
      { delimiters = '<>' }
    )
  ),
  s(
    'frame',
    fmt(
      [[
      \begin{frame}{<>}
        <>
      \end{frame}
      ]],
      { i(1), i(2) },
      { delimiters = '<>' }
    )
  ),
  s(
    'beg',
    fmt(
      [[
    \begin{<>}<>
    \end{<>}
    ]],
      { i(1), i(2), rep(1) }, -- repeat node 1
      { delimiters = '<>' }
    )
  ),
  s('ll', fmt([[\label{<>}]], { i(1) }, { delimiters = '<>' })),
  s('ref', fmt([[\cref{<>}]], { i(1) }, { delimiters = '<>' })),
  s('Ref', fmt([[\Cref{<>}]], { i(1) }, { delimiters = '<>' })),
  s('bf', fmt([[\textbf{<>}]], { i(1) }, { delimiters = '<>' })),
  s('vv', fmt([[\mathbf{<>}]], { i(1) }, { delimiters = '<>' })),
  s('cal', fmt([[\mathcal{<>}]], { i(1) }, { delimiters = '<>' })),
  s('it', fmt([[\textit{<>}]], { i(1) }, { delimiters = '<>' })),
  s('ii', fmt([[\item <>]], { i(1) }, { delimiters = '<>' })),
  s('em', fmt([[\emph{<>}]], { i(1) }, { delimiters = '<>' })),
  s('$', fmt([[\(<>\)]], { i(1) }, { delimiters = '<>' })),
  s('^', fmt([[^{<>}]], { i(1) }, { delimiters = '<>' })),
  s('_', fmt([[_{<>}]], { i(1) }, { delimiters = '<>' })),
}
