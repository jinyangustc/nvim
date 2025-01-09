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

local function comment_str(_, parent, _)
  return require('luasnip.util.util').buffer_comment_chars()[1]
end

local get_current_indent = function()
  local line = vim.fn.line '.'
  return vim.fn.indent(line)
end

local function comment_header(args, parent, _)
  local text = args[1][1]
  local c_str = comment_str(_, parent, _)
  local indent = get_current_indent()
  local total_length = 80 - indent - #text - #c_str - 3
  local dashes = string.rep('-', math.floor(total_length / 2))
  return dashes
end

return {
  s('---', {
    f(function(_, parent, _)
      return comment_str(_, parent, _) .. ' '
    end),
    f(comment_header, { 1 }),
    t ' ',
    i(1, 'header'),
    t ' ',
    f(comment_header, { 1 }),
  }),
}
