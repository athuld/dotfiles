return {
    -- Colorscheme --
    -- {
    --     'marko-cerovac/material.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function() require 'colors' end
    -- },
    {
      "neanias/everforest-nvim",
      version = false,
      lazy = false,
      priority = 1000,
      config = function()
        require("configs.everforest")
      end,
    },
    -- Perfomance Plugins --
    {'lewis6991/impatient.nvim'},

    {'tweekmonster/startuptime.vim', cmd = "StartupTime"},

    -- Statusline : Lualine --
    {
        'nvim-lualine/lualine.nvim',
        event = "BufRead",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require 'configs.lualine' end
    },
    -- File Managers --
    {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
          "3rd/image.nvim",
        },
        config = function ()
            require("configs.neotree")
        end
    },

    -- Treesitter and supporting configs { autotag, ts-rainbow, indent-blankline}, --
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
        config = function() require 'configs.treesitter' end
    },
    {'HiPhish/rainbow-delimiters.nvim',
        event = "BufRead",
        lazy = true,
        config= function() require 'rainbow-delimiters.setup'.setup() end
    }, 
    {
        'windwp/nvim-ts-autotag',
        event = "BufReadPre",
        lazy = true,
        config = function() require'nvim-ts-autotag'.setup() end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = "BufRead",
        main = "ibl",
        opts = {},
        lazy = true,
        config = function() require 'configs.indent' end
    },
    -- LSP --
    {
        "williamboman/mason.nvim",
        lazy = true,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        event = "BufRead",
        lazy = true,
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            {'williamboman/mason.nvim'}, -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Snippets
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp"
            }
        },
        config = function() require 'configs.lsp-installer' end
    },
    {
        'nvimdev/lspsaga.nvim',
        event = "LspAttach",
        config = function() require('lspsaga').setup({}) end
    },
    -- Go --
    {
        'ray-x/go.nvim',
        dependencies = 'ray-x/guihua.lua',
        ft = 'go',
        config = function() require('go').setup() end
    },
    -- Completions --
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip', 'onsails/lspkind.nvim'
        },
        config = function() require 'configs.nvim-cmp' end
    },
    {
        'windwp/nvim-autopairs',
        event = 'VeryLazy',
        config = function() require 'configs.autopairs' end
    },
    -- Format--
    {
        'mhartington/formatter.nvim',
        cmd = "Format",
        config = function() require 'configs.format' end
    },
    -- ToggleTerm --
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = "BufRead",
        config = function() require 'configs.toggleterm' end
    },
    -- Bufferline --
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = "BufWinEnter",
        config = function() require 'configs.bufferline' end
    },
    -- Startup Page --
    {
        'goolord/alpha-nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡹⣿⣶⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⡿⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡈⠙⠻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⡿⠛⢛⣀⡀⠀⠀⠘⣿⡿⠿⣿⣦⠘⣿⡇⢀⡀⠀⠀⠀⣀⡀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠿⠇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⣿⣿⣿⠏⣠⣾⣿⢻⣿⡀⠀⠀⣿⣧⣤⣿⡿⠀⣿⡟⢻⣿⡆⣰⣿⠟⢻⣷⡄⣰⣿⣛⣻⣷⠈⣿⣷⠛⣿⣧⠈⣿⡇⠈⢿⣷⣼⡿⠁⠀
⠀⠀⠀⠀⠀⠀⠈⠉⠉⢁⣾⣿⡏⢰⣿⣿⠃⠀⣿⠇⠀⠀⣿⡇⠀⠀⠀⠀⣿⡇⢸⣿⡇⢻⣿⣄⣰⣿⡇⢿⣿⣛⣛⣛⠀⣿⣿⠀⣿⣿⠀⣿⡇⠀⣴⣿⣿⣦⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠀⢸⣿⣿⠀⠀⠏⠀⠀⠀⠛⠃⠀⠀⠀⠀⠛⠃⠈⠛⠃⠀⠉⠛⠛⠉⠀⠀⠙⠛⠛⠉⠀⠛⠛⠀⠛⠋⠀⠛⠃⠘⠛⠁⠈⠛⠃⠀
⠀⠀⣀⣀⣠⣤⣶⣿⣿⠿⠋⠀⠀⢸⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⣠⣿⢿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡏⠸⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡃⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]
            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("SPC c", "  New file", "<CMD>ene!<CR>"),
                dashboard.button("SPC o", "  Recently opened files",
                                 "<CMD>lua require('telescope.builtin').oldfiles()<CR>"),
                dashboard.button("; f", "  Find File",
                                 "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>"),
                dashboard.button("; g", "  Find Word",
                                 "<CMD>lua require('telescope.builtin').live_grep()<CR>"),
                dashboard.button("SPC q", "  Quit", "<CMD>qa<CR>")
            }
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.opts.layout[1].val = 6
            return dashboard
        end,
        config = function(_, dashboard)
            require("alpha").setup(dashboard.opts)
            vim.api.nvim_create_autocmd("User", {
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100) / 100
                    dashboard.section.footer.val =
                        "󱐌 Lazy-loaded " .. stats.loaded .. " plugins in " ..
                            ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end
            })
        end
    },
    -- Emmet --
    {
        'mattn/emmet-vim',
        ft = {
            "javascript", "javascriptreact", "typescript", "typescriptreact",
            "jsx", "tsx", "html", "css", "scss"
        },
        event = "InsertEnter",
        config = function() require 'configs.emmet' end
    },
    -- Telescope --
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'jvgrootveld/telescope-zoxide',
            'AckslD/nvim-neoclip.lua',
            'nvim-telescope/telescope-fzy-native.nvim'
        },
        config = function() require 'configs.telescope' end
    },


    -- Comment--
    {
        'terrortylor/nvim-comment',
        event = "BufRead",
        lazy = false,
        config = function()
            require('nvim_comment').setup({comment_empty = false})
        end
    },
    -- Vim-Surround --
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    -- Colorizer --
    {
        'norcalli/nvim-colorizer.lua',
        event = "BufRead",
        lazy = true,
        config = function() require'colorizer'.setup() end
    },
    -- Sudo Priveledges --
    {'lambdalisue/suda.vim', lazy = true, event = "BufRead"},
    -- Git --
    {
        'lewis6991/gitsigns.nvim',
        event = "BufRead",
        lazy = true,
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function() require 'configs.gitsigns' end
    },
    -- Markdown and vimwiki --
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
    {
      "lima1909/resty.nvim",
      ft="http",
      lazy=true,
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'Pocco81/auto-save.nvim',
        event = "BufRead",
        config = function() require("auto-save").setup {} end
    }
}
