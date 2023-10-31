function telescope_buffer_dir() return vim.fn.expand('%:p:h') end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
     file_ignore_patterns = {
         "node_modules",
         ".git"
         },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
},
  extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')
require'telescope'.load_extension('zoxide')
require('neoclip').setup()
require('telescope').load_extension('neoclip')
