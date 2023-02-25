local present, packer = pcall(require, "packerInit")

if not present then return false end

local use = require('packer').use

return require('packer').startup({
    function()

        -- Have packer manage itself
        use {'wbthomason/packer.nvim', event = "VimEnter"}

        -- Perfomance Plugins --
        use {'nathom/filetype.nvim'}

        use {'lewis6991/impatient.nvim'}

        use {'tweekmonster/startuptime.vim'}

        -- Colorscheme --
        use {'marko-cerovac/material.nvim', config = [[require'colors']]}

        -- Statusline : Lualine --
        use {
            'nvim-lualine/lualine.nvim',
            event = "BufRead",
            requires = 'kyazdani42/nvim-web-devicons',
            config = [[require'configs.lualine']]
        }

        -- File Managers --
        use {
          'nvim-tree/nvim-tree.lua',
          requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
          },
          tag = 'nightly', -- optional, updated every week. (see issue #1193)
          config = [[require'configs.nvim-tree']]
        }

        use {'kevinhwang91/rnvimr', cmd = "RnvimrToggle"}

        -- Treesitter and supporting configs { autotag, ts-rainbow, indent-blankline} --
        use {
            'nvim-treesitter/nvim-treesitter',
            config = [[require'configs.treesitter']]
        }
        use({
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter",
            requires = "nvim-treesitter/nvim-treesitter",
        })

        use {
            'p00f/nvim-ts-rainbow',
            event = "BufRead",
            after = "nvim-treesitter"
        }

        use {
            'windwp/nvim-ts-autotag',
            after = "nvim-treesitter",
            event = "InsertEnter",
            config = [[require'nvim-ts-autotag'.setup()]]
        }

        use {
            'lukas-reineke/indent-blankline.nvim',
            event = "BufRead",
            after = "nvim-treesitter",
            config = [[require'configs.indent']]
        }

        -- LSP --
        use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          event = "BufRead",
          requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
          },
          config= [[require'configs.lsp-installer']]
        }

        use {
            'tami5/lspsaga.nvim',
            after = "nvim-lspconfig",
            config = [[require'configs.lspsaga']]
        }

        -- Go --
        use {
            'ray-x/go.nvim',
            requires = 'ray-x/guihua.lua',
            ft= 'go',
            config = [[require('go').setup()]],
        }

        -- Completions --
        use {
            'hrsh7th/nvim-cmp',
            event = "InsertEnter",
            config = [[require'configs.nvim-cmp']]
        }

        use {'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp"}
        use {'hrsh7th/cmp-buffer', after = "nvim-cmp"}
        use {'hrsh7th/cmp-path', after = "nvim-cmp"}
        use {
            'windwp/nvim-autopairs',
            after = "nvim-cmp",
            config = [[require'configs.autopairs']]
        }
        use {'hrsh7th/cmp-vsnip', after = "nvim-cmp"}
        use {'hrsh7th/vim-vsnip', after = "nvim-cmp"}
        use {'onsails/lspkind-nvim', after = "nvim-cmp"}

        -- Format--
        use {
            'mhartington/formatter.nvim',
            cmd = "Format",
            config = [[require'configs.format']]
        }

        -- ToggleTerm --
        use {
            'akinsho/toggleterm.nvim',
            tag = "*",
            event = "BufRead",
            config = [[require'configs.toggleterm']]
        }

        -- Bufferline --
        use {
            'akinsho/bufferline.nvim',
            tag = "*",
            requires = 'kyazdani42/nvim-web-devicons',
            event = "BufWinEnter",
            config = [[require'configs.bufferline']]
        }

        -- Startup Page --
        use {'goolord/alpha-nvim', config = [[require'configs.alpha']]}

        -- Emmet --
        use {
            'mattn/emmet-vim',
            ft = {
                "javascript", "javascriptreact", "typescript",
                "typescriptreact", "jsx", "tsx", "html", "css", "scss"
            },
            event = "InsertEnter",
            config = [[require'configs.emmet']]
        }

        -- Telescope --
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim',
                'jvgrootveld/telescope-zoxide',
                {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
                'AckslD/nvim-neoclip.lua'
            },
            config = [[require'configs.telescope']]
        }

        -- Comment--
        use {
            'terrortylor/nvim-comment',
            event = "BufRead",
            config = [[require('nvim_comment').setup({comment_empty = false})]]
        }

        -- Vim-Surround --
        use {
            'athuld/surround.nvim',
            event = "BufRead",
            config = [[require'surround'.setup {mappings_style = "surround"}]]
        }

        -- Colorizer --
        use {
            'norcalli/nvim-colorizer.lua',
            event = "BufRead",
            after = "nvim-treesitter",
            config = [[require'colorizer'.setup()]]
        }

        -- Sudo Priveledges --
        use {'lambdalisue/suda.vim', event = "BufRead"}


        -- Git --
        use {
            'lewis6991/gitsigns.nvim',
            event = "BufRead",
            requires = {'nvim-lua/plenary.nvim'},
            config = [[require'configs.gitsigns']]
        }

        -- Markdown and vimwiki --
        use {"ellisonleao/glow.nvim", ft = "markdown"}


        use {
            'NTBBloodbath/rest.nvim',
            requires = {'nvim-lua/plenary.nvim'},
            ft = "http",
            config = [[require'configs.rest']]
        }

        use {
            'Pocco81/auto-save.nvim',
            event = "BufRead",
            config = function() require("auto-save").setup {} end
        }

    end,
    config = {
        -- Move to lua dir so impatient.nvim can cache it
        compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua'
    }
})
