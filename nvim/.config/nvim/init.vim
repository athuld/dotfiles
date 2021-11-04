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
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
set clipboard=unnamedplus
set mouse=nv
set completeopt=menu,menuone,noselect
set modifiable
set relativenumber

call plug#begin('~/.vim/plugged')
    Plug 'hoob3rt/lualine.nvim'
    Plug 'sainnhe/everforest'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ap/vim-css-color'
    Plug 'windwp/nvim-autopairs'
    Plug 'romgrk/barbar.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'rbgrouleff/bclose.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-signify'
    Plug 'voldikss/vim-floaterm'
    Plug 'neoclide/vim-jsx-improve'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'SirVer/ultisnips'
    Plug 'lambdalisue/suda.vim'
    Plug 'mhartington/formatter.nvim'
    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'
    Plug 'mattn/emmet-vim'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-lsputils'
    " Plug 'github/copilot.vim'
    Plug 'sbdchd/neoformat'
call plug#end()

syntax on
" colorscheme onedark
set background=dark
colorscheme everforest
let g:everforest_background = 'hard'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_enable_italic = 1
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_better_performance = 1

"------------------------------------
" Lua Configs

lua << EOF
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
  section_separators = {'', ''},
  component_separators = {'', ''}
},
sections={ 
lualine_c = {'diff','filename'},
}
}

--- Auto Pairs
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

--- Autocomplete with nvim lsp
vim.o.completeopt = "menuone,noselect"

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format(),
  },
}

---Nvim Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "javascript",
    "css",
    "java",
    "json",
    "html",
    "scss",
    "bash",
    "python"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- LSP Server config
require "lspconfig".cssls.setup(
  {
    cmd = {"vscode-css-language-server", "--stdio"},
    capabilities = capabilities,
    settings = {
      scss = {
        lint = {
          idSelector = "warning",
          zeroUnits = "warning",
          duplicateProperties = "warning"
        },
        completion = {
          completePropertyWithSemicolon = true,
          triggerPropertyValueCompletion = true
        }
      }
    }
  }
)

require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
    capabilities = capabilities
  }
end



require'navigator'.setup()

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
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep({ vimgrep_arguments = { 'rg',  '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '-u', '--hidden' } })<cr>
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


" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

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
map <C-_> gc

" Vim Signify
let g:signify_sign_add               = '▎'
let g:signify_sign_delete            = '▎'
let g:signify_sign_change            = '▎'

" Floaterm 
let g:floaterm_keymap_toggle = '<leader>fd'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
let g:floaterm_keymap_kill   = '<leader><leader>d'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
" Open up lazygit
nnoremap <leader>fg :FloatermNew lazygit<CR>
" Open up gotop
nnoremap <leader>fgt :FloatermNew gotop<CR>


" Close Tags
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*tsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<C-]>'

" Emmet
let g:user_emmet_leader_key='<C-l>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}


" Vim signify
" default updatetime 4000ms is not good for async update
set updatetime=2000

" Rainbow
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

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

" abbreviations
iabbr sout System.out.println(<Right>;<Left><Left><c-r>=Eatchar('\m\s\<bar>/')<cr>
iabbr jmain public static void main(String[] args){}<Left><Return>


" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'       '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" augroup fmt
"   autocmd!
"   autocmd BufWritePost * undojoin | Neoformat
" augroup END
