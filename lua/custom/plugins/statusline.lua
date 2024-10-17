-- See: https://github.com/tpope/dotfiles/blob/30b0609c6bdc38eb607530d6a1b603dbfdc8a8ef/.vimrc#L97
vim.opt.laststatus = 2
-- %-0{minwid}.{maxwid}{item}, so "%.99f" means "path to the file, max width 99 chars"
--
-- %n: buffer number
-- %<: where to truncate if the line is too long
-- %f: Path to the file in the buffer, as typed or relative to current directory.
-- %y: Type of file in the buffer, e.g., "[vim]".  See 'filetype'.
-- %h: Help buffer flag, text is "[help]".
-- %w: Preview window flag, text is "[Preview]".
-- %m: Modified flag, text is "[+]"; "[-]" if 'modifiable' is off.
-- %r: Readonly flag, text is "[RO]".
-- %=: Separation point between alignment sections.
-- %l: Line number.
-- %c: Column number (byte index).
-- %V: Virtual column number as -{num}.  Not displayed if equal to 'c'.
-- %P: Percentage through file of displayed window.
--
-- vim.opt.statusline = '[%n] %<%.99f %y%h%w%m%r%=%-14.(%l,%c%V%) %P'

--
-- Using mini.statusline
--

-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
-- set use_icons to true if you have a Nerd Font
statusline.setup { use_icons = vim.g.have_nerd_font }

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v %P'
end

-- shorten git section: remove trailing "Git: "
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_git = function(args)
  if statusline.is_truncated(args.trunc_width) then
    return ''
  end

  local summary = vim.b.minigit_summary_string or vim.b.gitsigns_head
  if summary == nil then
    return ''
  end

  return (summary == '' and '-' or '[' .. summary .. ']')
end

-- shorten mode info
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_mode = function()
  local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
  local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)
  local H = {}
  H.modes = setmetatable({
    ['n'] = { long = 'Normal', short = 'N', hl = 'MiniStatuslineModeNormal' },
    ['v'] = { long = 'Visual', short = 'V', hl = 'MiniStatuslineModeVisual' },
    ['V'] = { long = 'V-Line', short = 'V-L', hl = 'MiniStatuslineModeVisual' },
    [CTRL_V] = { long = 'V-Block', short = 'V-B', hl = 'MiniStatuslineModeVisual' },
    ['s'] = { long = 'Select', short = 'S', hl = 'MiniStatuslineModeVisual' },
    ['S'] = { long = 'S-Line', short = 'S-L', hl = 'MiniStatuslineModeVisual' },
    [CTRL_S] = { long = 'S-Block', short = 'S-B', hl = 'MiniStatuslineModeVisual' },
    ['i'] = { long = 'Insert', short = 'I', hl = 'MiniStatuslineModeInsert' },
    ['R'] = { long = 'Replace', short = 'R', hl = 'MiniStatuslineModeReplace' },
    ['c'] = { long = 'Command', short = 'C', hl = 'MiniStatuslineModeCommand' },
    ['r'] = { long = 'Prompt', short = 'P', hl = 'MiniStatuslineModeOther' },
    ['!'] = { long = 'Shell', short = 'Sh', hl = 'MiniStatuslineModeOther' },
    ['t'] = { long = 'Terminal', short = 'T', hl = 'MiniStatuslineModeOther' },
  }, {
    -- By default return 'Unknown' but this shouldn't be needed
    __index = function()
      return { long = 'Unknown', short = 'U', hl = '%#MiniStatuslineModeOther#' }
    end,
  })
  local mode_info = H.modes[vim.fn.mode()]
  local mode = mode_info.short
  return mode, mode_info.hl
end

-- set statusline sections
---@diagnostic disable-next-line: duplicate-set-field
statusline.active = function()
  -- local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
  -- local diff = MiniStatusline.section_diff { trunc_width = 75 }
  -- local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
  local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }

  local git = MiniStatusline.section_git { trunc_width = 40 }
  local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
  local filename = MiniStatusline.section_filename { trunc_width = 140 }
  local location = MiniStatusline.section_location { trunc_width = 75 }
  -- local search = MiniStatusline.section_searchcount { trunc_width = 75 }

  return statusline.combine_groups {
    { hl = '', strings = { filename } },
    '%<', -- Mark general truncate point
    { hl = '', strings = { git } },
    { hl = '', strings = { fileinfo } },
    -- { hl = '', strings = { search } },
    '%=', -- End left alignment
    { hl = '', strings = { diagnostics } },
    { hl = '', strings = { location } },
  }
end

return {}
