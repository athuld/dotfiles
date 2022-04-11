  local cmp = require'cmp'

  cmp.setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  insert = false, -- use insert confirm behavior instead of replace
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<CR>'] = cmp.mapping.confirm({select=true}),
      },
     completion = {
        completeopt = 'menu,menuone,noinsert'
      },
    sources = {
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer',keyword_length=5 },
      { name = 'path'}
    },
    experimental={
      native_menu=false,
      ghost_text= true,
    }
  })
 
