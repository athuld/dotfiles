local present, packer = pcall(require, "packerInit")

if not present then
  return false
end

local use = require('packer').use


return require('packer').startup({function()

   -- Have packer manage itself
    use {
      'wbthomason/packer.nvim',
        event="VimEnter"
   }

   -- Perfomance Plugins --
    use {'nathom/filetype.nvim'}

    use {'lewis6991/impatient.nvim'}

    use {'tweekmonster/startuptime.vim'}

   -- Colorscheme --
    use {
        'sainnhe/everforest',
        config=[[require'colors']]
    }

   -- Statusline : Lualine --
    use {'hoob3rt/lualine.nvim',
        event="BufRead",
        requires ='kyazdani42/nvim-web-devicons',
        config=[[require'configs.lualine']]
    }

   -- File Managers --
    use {'kyazdani42/nvim-tree.lua',
        event="BufWinEnter",
        requires ='kyazdani42/nvim-web-devicons',
        config=[[require'configs.nvim-tree']]
    }
   
    use {
        'kevinhwang91/rnvimr',
        cmd="RnvimrToggle"
    }

   -- Treesitter and supporting configs { autotag, ts-rainbow, indent-blankline} --
    use {'nvim-treesitter/nvim-treesitter',
            config=[[require'configs.treesitter']]
    }

    use {
        'p00f/nvim-ts-rainbow',
        event="BufRead",
        after="nvim-treesitter"
    }

    use {
        'windwp/nvim-ts-autotag',
        after="nvim-treesitter",
        event="InsertEnter",
        config=[[require'nvim-ts-autotag'.setup()]]
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        event="BufRead",
        after="nvim-treesitter",
        config=[[require'configs.indent']]
    }


   -- LSP --
    use {'neovim/nvim-lspconfig',
     event="BufRead",
     config=[[require'configs.lspconfig']]
    }

    use {
        'williamboman/nvim-lsp-installer',
        after="nvim-lspconfig",
        config=[[require'configs.lsp-installer']]
    }

    -- Completions --
    use {
        'hrsh7th/nvim-cmp',
        event="InsertEnter",
        config=[[require'configs.nvim-cmp']]
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        after="nvim-cmp"
    }
    use {
        'hrsh7th/cmp-buffer',
        after="nvim-cmp"
    }
    use {
        'hrsh7th/cmp-path',
        after="nvim-cmp"
    }
    use {
        'windwp/nvim-autopairs',
        after="nvim-cmp",
        config=[[require'configs.autopairs']]
    }
    use {
        'hrsh7th/cmp-vsnip',
        after="nvim-cmp"
    }
    use {
        'hrsh7th/vim-vsnip',
        after="nvim-cmp"
    }
    use {
        'onsails/lspkind-nvim',
        after="nvim-cmp"
    }

    -- JDTLS for Java --
    use {
        'mfussenegger/nvim-jdtls',
        ft="java",
        config=[[require'configs.jdtls'.setup()]]
    }

    -- Format--
    use {
        'lukas-reineke/format.nvim',
        cmd="FormatWrite",
        config=[[require'configs.format']]
    }

    -- ToggleTerm --
    use {
        'akinsho/toggleterm.nvim',
        event="BufRead",
        config=[[require'configs.toggleterm']]
    }

    -- Bufferline --
    use {'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event="BufRead",
    config=[[require'configs.bufferline']]
    }

    -- Emmet --
    use {
        'mattn/emmet-vim',
        ft={"javascript","javascriptreact","typescript","typescriptreact","jsx","tsx","html","css","scss"},
        event="InsertEnter",
        config=[[require'configs.emmet']]
    }

    -- Telescope --
    use {
    'nvim-telescope/telescope.nvim',
    event="BufRead",
    requires = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'jvgrootveld/telescope-zoxide',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    'AckslD/nvim-neoclip.lua',
      },
     config=[[require'configs.telescope']]
    }

    -- Comment--
    use {
        'terrortylor/nvim-comment',
        event="BufRead",
        config=[[require('nvim_comment').setup({comment_empty = false})]]
    }

    -- Vim-Surround --
    use {
        'blackCauldron7/surround.nvim',
        event="BufRead",
        config=[[require'surround'.setup {mappings_style = "surround"}]]
    }

    -- Colorizer --
    use {
        'norcalli/nvim-colorizer.lua',
        event="BufRead",
        after="nvim-treesitter",
        config=[[require'colorizer'.setup()]]
    }

    -- Sudo Priveledges --
    use {
        'lambdalisue/suda.vim',
        event="BufRead"
    }

    -- Zenmode --
    use {
        'folke/zen-mode.nvim',
        event="BufRead",
        config=[[require('zen-mode').setup{}]]
    }

    use {
        'folke/twilight.nvim',
        after="zen-mode.nvim",
        config=[[require('twilight').setup{}]]
    }

    -- Git --
    use {
        'lewis6991/gitsigns.nvim',
        event="BufRead",
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config=[[require'configs.gitsigns']]
    }

    -- Markdown and vimwiki --
    use {
        "ellisonleao/glow.nvim",
        ft="markdown"
    }

    use {'vimwiki/vimwiki',
    event ="BufRead",
    keys = { 
        { 'n', '<space>ww' },
    },
    setup = function()
        vim.g.vimwiki_list = {
            {
                path = '~/vimwiki',
                syntax = 'markdown',
                ext = '.md',
            },
        }
    end,}

    use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    ft="http",
    config=[[require'configs.rest']]
    }


    use {
        'lervag/vimtex',
        ft="tex",
        event="BufRead",
    }

    use {
        'Pocco81/AutoSave.nvim',
        event="BufRead",
        config=[[require'configs.autosave']]
    }


end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
})
