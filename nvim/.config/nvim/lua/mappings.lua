vim.g.mapleader = " "

-- Utility servers
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Mappings

-- Ranger
map('n', '<leader>e', ':RnvimrToggle<CR>', opts)

-- Nvim-Tree
-- map("n", "<leader>n", ":NeoTreeRevealToggle<CR>", opts)
-- map("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>n", ":Neotree toggle<CR>", opts)

-- BufferLine
map('n', '<S-tab>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<leader>d', ':Bclose<CR>', opts)
map('n', '<C-p>', ':BufferLinePick<CR>', opts)

-- Telescope
map('n', ';f',
    ":lua require('telescope.builtin').find_files()<cr>", opts)
map('n', ';d',
    ":lua require('telescope.builtin').find_files({hidden = true})<cr>", opts)
map('n', ';g', ":lua require('telescope.builtin').live_grep()<cr>", opts)
map('n', ';s', ":lua require('telescope.builtin').git_status()<cr>", opts)
map('n', ';h',
    ":lua require('telescope.builtin').live_grep({prompt_title='Live Grep (hidden)', additional_args=function(opts) return {'--hidden'} end})<cr>",
    opts)
map('n', '\\\\', ":lua require('telescope.builtin').buffers()<cr>", opts)
map('n', ';;', ":lua require('telescope.builtin').help_tags()<cr>", opts)
map('n', '<leader>p', ':Telescope neoclip<cr>', opts)
map('n', ';z',
    ":lua require'telescope'.extensions.zoxide.list({ initial_mode = 'normal' })<cr>",
    opts)
map('n', '<leader>o', ":lua require('telescope.builtin').oldfiles()<cr>", opts)

-- Comment
map('i', '<C-_>', 'gcc', {silent = true})
map('n', '<C-_>', 'gcc', {silent = true})
map('v', '<C-_>', 'gc', {silent = true})

-- Toggleterm with lazygit
map('n', '<leader>g', ':lua _lazygit_toggle()<CR>', opts)

-- Vsnip
map('i', '<C-l>', '<Plug>(vsnip-expand-or-jump)', {silent = true})
map('s', '<C-l>', '<Plug>(vsnip-expand-or-jump)', {silent = true})

-- Format
map('n', '<leader>f', ':Format<cr>', opts)

-- REST
map('n', ';r', '<Plug>RestNvim', {silent = true})

-- Some general remaps

-- New File
map('n', '<leader>c', ':ene<cr>', opts)

-- Resize window
map('n', '<leader>,', ':vertical resize -5<cr>', opts)
map('n', '<leader>.', ':vertical resize +5<cr>', opts)

-- Splits
map('n', '<leader>v', ':vsplit<cr>', opts)
map('n', '<leader>s', '<C-w>w', opts)

-- To keep inline with D and C maps
map('n', 'Y', 'y$', opts)

-- Faster file saving and exiting:
map('n', '<leader>w', '<cmd>w<cr>', opts)
map('n', '<leader>q', '<cmd>q<cr>', opts)

-- Keep it centered
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mzJ\'z', opts)

-- Moving Text
map('v', 'J', ':m \'>+1<CR>gv=gv', opts)
map('v', 'K', ':m \'<-2<CR>gv=gv', opts)
map('i', '<C-j>', '<esc>:m .+1<CR>==', opts)
map('i', '<C-k>', '<esc>:m .-2<CR>==', opts)
map('n', '<leader>j', ':m .+1<CR>==', opts)
map('n', '<leader>k', ':m .-2<CR>==', opts)

-- LSP Saga
--- In lsp attach function
map("n", "<leader>r", "<cmd>Lspsaga rename<cr>", opts)
map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
map("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
map("n", "gd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
map("n", "<C-u>",
    ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
map("n", "<C-d>",
    ":lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)

-- For Java
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- -- since we lazy load packer.nvim, we need to load it when we run packer-related commands
vim.cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
vim.cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
vim.cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
vim.cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
vim.cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
