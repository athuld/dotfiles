vim.opt.number = true
vim.opt.fileencodings = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.inccommand = "split"
vim.opt.termguicolors = true
vim.opt.sc = false
vim.opt.ru = false
vim.opt.sm = false
vim.opt.lazyredraw = true
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.path:append "**"
vim.opt.wildignore:append "*/node_modules/*"
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "nv"
vim.opt.modifiable = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.swapfile = false

-- Ranger specific
vim.g.rnvimr_ex_enable = 1
vim.g.rnvimr_enable_picker = 1

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

-- Glow
vim.g.glow_binary_path = ".config/nvim/bin"
