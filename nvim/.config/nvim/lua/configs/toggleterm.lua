require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = fish,
  float_opts = {
    border = 'curved',
    width = 95,
    height = 27,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({cmd = "lazygit", hidden = true})

---@diagnostic disable-next-line: lowercase-global
function _lazygit_toggle() lazygit:toggle() end
