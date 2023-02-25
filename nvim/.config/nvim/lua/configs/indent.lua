vim.cmd [[highlight IndentBlanklineIndent guifg=#434e59 gui=nocombine]]

vim.opt.list = true
require("indent_blankline").setup {
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  buftype_exclude = {"terminal"},
  filetype_exclude = {"NvimTree", "lspinfo", "TelescopePrompt", "TelescopeResults", "mason", "packer"},
  char_highlight_list = {"IndentBlanklineIndent"}
}
