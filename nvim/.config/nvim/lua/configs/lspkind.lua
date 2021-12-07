local lspkind = require('lspkind')
local cmp = require'cmp'

cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        vsnip = "[snip]",
        buffer = "[buf]",
        path = "[path]",
      },
    },
  },
}
