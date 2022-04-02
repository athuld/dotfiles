-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/athul/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/athul/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/athul/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/athul/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/athul/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "require'configs.autosave'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require'configs.bufferline'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["emmet-vim"] = {
    config = { "require'configs.emmet'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  everforest = {
    config = { "require'colors'" },
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "require'configs.format'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "require'configs.gitsigns'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require'configs.indent'" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "require'configs.lspsaga'" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require'configs.lualine'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require'configs.autopairs'" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "lspkind-nvim", "vim-vsnip", "cmp-buffer", "nvim-autopairs", "cmp-nvim-lsp", "cmp-path", "cmp-vsnip" },
    config = { "require'configs.nvim-cmp'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require'colorizer'.setup()" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "require('nvim_comment').setup({comment_empty = false})" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-jdtls"] = {
    config = { "require'configs.jdtls'.setup()" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lsp-installer"] = {
    config = { "require'configs.lsp-installer'" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-lsp-installer", "lspsaga.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "require'configs.nvim-tree'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "indent-blankline.nvim", "nvim-colorizer.lua", "nvim-ts-rainbow", "nvim-ts-autotag" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-autotag"] = {
    config = { "require'nvim-ts-autotag'.setup()" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rest.nvim"] = {
    config = { "require'configs.rest'" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  rnvimr = {
    commands = { "RnvimrToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/rnvimr",
    url = "https://github.com/kevinhwang91/rnvimr"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["suda.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["surround.nvim"] = {
    config = { "require'surround'.setup {mappings_style = \"surround\"}" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/surround.nvim",
    url = "https://github.com/athuld/surround.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/home/athul/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    config = { "require'configs.telescope'" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require'configs.toggleterm'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["twilight.nvim"] = {
    config = { "require('twilight').setup{}" },
    load_after = {
      ["zen-mode.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  vimwiki = {
    keys = { { "n", "<space>ww" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["zen-mode.nvim"] = {
    after = { "twilight.nvim" },
    config = { "require('zen-mode').setup{}" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/athul/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vimwiki
time([[Setup for vimwiki]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\vsyntax\rmarkdown\tpath\14~/vimwiki\bext\b.md\17vimwiki_list\6g\bvim\0", "setup", "vimwiki")
time([[Setup for vimwiki]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require'configs.treesitter'
time([[Config for nvim-treesitter]], false)
-- Config for: everforest
time([[Config for everforest]], true)
require'colors'
time([[Config for everforest]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrToggle lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[nnoremap <silent> <space>ww <cmd>lua require("packer.load")({'vimwiki'}, { keys = "<lt>space>ww", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'emmet-vim'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType http ++once lua require("packer.load")({'rest.nvim'}, { ft = "http" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'emmet-vim', 'nvim-cmp', 'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'nvim-tree.lua'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'zen-mode.nvim', 'nvim-lspconfig', 'suda.vim', 'surround.nvim', 'indent-blankline.nvim', 'telescope.nvim', 'lualine.nvim', 'toggleterm.nvim', 'nvim-colorizer.lua', 'vimtex', 'nvim-comment', 'bufferline.nvim', 'vimwiki', 'gitsigns.nvim', 'nvim-ts-rainbow', 'AutoSave.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], true)
vim.cmd [[source /home/athul/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]]
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/rest.nvim/ftdetect/http.vim]], false)
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/athul/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
