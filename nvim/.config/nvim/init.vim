" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small

set number
syntax enable
set fileencodings=utf-8
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set nohlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=8
set expandtab
set smartindent
"let loaded_matchparen = 1
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
set inccommand=split

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
set ignorecase
" Be smart when using tabs ;)
set smarttab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
set clipboard=unnamedplus
set mouse=nv
set modifiable
set relativenumber
set cursorline
set noswapfile
call plug#begin('~/.vim/plugged')
    Plug 'hoob3rt/lualine.nvim'
    Plug 'sainnhe/everforest'
    Plug 'iamcco/markdown-preview.nvim', { 'for':'markdown','do': 'cd app && yarn install'  }
    Plug 'tpope/vim-markdown',{ 'for': 'markdown' }
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'norcalli/nvim-colorizer.lua',{'on':'ColorizerAttachToBuffer'}
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'romgrk/barbar.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kevinhwang91/rnvimr'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'tpope/vim-commentary'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'lambdalisue/suda.vim',{'on':'SudaWrite'}
    Plug 'mattn/emmet-vim'
    Plug 'mfussenegger/nvim-jdtls',{ 'for': 'java' }
    " Plug 'github/copilot.vim'
    Plug 'lukas-reineke/format.nvim'
    Plug 'kdheepak/lazygit.nvim'
    Plug 'junegunn/goyo.vim',{ 'for': 'markdown' }
    Plug 'junegunn/limelight.vim',{ 'for': 'markdown' }
    Plug 'vimwiki/vimwiki'
    Plug 'sedm0784/vim-you-autocorrect',{ 'for': 'markdown' }
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'lewis6991/impatient.nvim'
call plug#end()

syntax on

set termguicolors
filetype plugin on
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_enable_italic = 0
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_ui_contrast = 'high'
colorscheme everforest 
"------------------------------------
" Lua Configs

lua << EOF
require('impatient')
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- Statusline : Lualine
require('lualine').setup{
options = {theme = 'everforest',
section_separators = { left = '', right = ''},
component_separators = { left = '', right = ''}
},
}

--- Auto Pairs
require('nvim-autopairs').setup({
  check_ts = true,
})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- Auto Tags
require('nvim-ts-autotag').setup()


  -- Setup nvim-cmp.
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
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer',keyword_length=5 },
      { name = 'path'}
    },
    experimental={
      native_menu=false,
      ghost_text= true,
    }
  })
 
-- Lspkind
local lspkind = require('lspkind')
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

---Nvim Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
 rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {
        "#c678dd",
        "#d19a66",
        "#56b6c2",
        "#ff6bf3",
        "#666bd1",
        "#c27556",
    },
  },
  ensure_installed = {
    "lua",
    "vim",
    "go",
    "css",
    "java",
    "json",
    "html",
    "scss",
    "bash",
    "python"
  },
  context_commentstring = {
    enable = true
  },
  autopairs = {
    enable = true
  },
  autotag = {
    enable=true
  }
}

-- Lsp-Installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    server:setup(opts)
end)
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


-- Telescope
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

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
  }
}

vim.opt.list = true

require('gitsigns').setup{signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    }}

-- Prettier function for formatter
require'format'.setup {
  html = {{cmd = {"prettier -w"}}},
  css = {{cmd = {"prettier -w"}}},
  scss = {{cmd = {"prettier -w"}}},
  json = {{cmd = {"prettier -w"}}},
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
}

-- Runs Formatter on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.css,*.scss,*.md,*.html,*.lua : FormatWrite
augroup END
]],
  true
)

-- Nvim Tree
require('nvim-tree-config')

vim.cmd [[highlight IndentBlanklineIndent guifg=#434e59 gui=nocombine]]

vim.opt.list = true
require("indent_blankline").setup{
    use_treesitter = true,
    show_trailing_blankline_indent = false,
    buftype_exclude = {"terminal"},
    filetype_exclude = {
    "NvimTree",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer"
    },
    char_highlight_list = {
      "IndentBlanklineIndent",
    }
}

-- Toggleterm 
require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = 95,
    height = 27,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

-- Diagnostics Signs LSP
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

EOF

"--------------------------------------

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif


augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END


au VimLeave * set guicursor=a:ver1


  augroup lsp
    au!
    au FileType java lua require'jdtls_config'.setup()
  augroup end

"------------------------------------
" Mappings

" Leader key
let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files({find_command = { 'rg', '--files', '--hidden' } })<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Switching Buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
noremap <leader>d :BufferClose<CR>

" Ranger Fil Manager 
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

nmap <space>e :RnvimrToggle<CR>


" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Comments
nmap <C-_> gcc
vmap <C-_> gc

" Emmet
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return emmet#expandAbbrIntelligent("\<tab>")
    " return "\<C-y>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction
  " let g:user_emmet_expandabbr_key='<Tab>'
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown.mdx EmmetInstall
"}}}


" Some general remaps

" To keep inline with D and C maps
nnoremap Y y$

" Faster file saving and exiting:
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>q<cr>

" Keep it centered 
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" function to delete trailing space after an abbreviation
	func Eatchar(pat)
    	let c = nr2char(getchar(0))
        return (c =~ a:pat) ? '' : c
endfunc


" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
" setup mapping to call :LazyGit
nnoremap <silent> <leader>g :LazyGit<CR>

" Note taking setup with vimwiki and markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java']

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nnoremap <silent> <leader>go :Goyo<CR>

" Folds
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" Auto corrections
nnoremap <silent> <leader>sp :EnableAutocorrect<CR>
nnoremap <silent> <leader>spp :DisableAutocorrect<CR>
