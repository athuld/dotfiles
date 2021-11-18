local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.mapleader = ' '
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}

require'nvim-tree'.setup {
  auto_close = true, -- Close vim when tree is only buffer
  hijack_cursor = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  filters = {
    dotfiles = false,
    custom = {
      ".git",
      "node_modules",
    }
  },
  view = {
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}



local map_opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", map_opt)
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", map_opt)
vim.api.nvim_exec("highlight NvimTreeFolderIcon guifg=#B39DDB", false)
vim.api.nvim_exec("highlight NvimTreeFolderName guifg=#d2fcc5", false)
