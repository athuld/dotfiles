local M = {}

local function ui_extension()
  local finders = require "telescope.finders"
  local sorters = require "telescope.sorters"
  local actions = require "telescope.actions"
  local pickers = require "telescope.pickers"
  local action_state = require "telescope.actions.state"

  require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
      prompt_title = prompt,
      finder = finders.new_table {
        results = items,
        entry_maker = function(entry)
          return {value = entry, display = label_fn(entry), ordinal = label_fn(entry)}
        end
      },
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry(prompt_bufnr)

          actions.close(prompt_bufnr)

          cb(selection.value)
        end)

        return true
      end
    }):find()
  end
end

local on_attach = function(client, bufnr)

  -- Utility servers
  local map = function(type, key, value)
    vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true});
  end
  -- GOTO mappings
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- ACTION mappings
  map('n', '<leader>ch', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', '<leader>ca', '<cmd>lua require"jdtls".code_action()<CR>')
  map('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- Few language severs support these three
  map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
  -- Diagnostics mapping
  -- map('n', '<leader>ci', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  -- map('n', '<leader>cn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  -- map('n', '<leader>cp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

  map('n', [[<leader>ai]], [[<Cmd>lua require'jdtls'.organize_imports()<CR>]])
  map('n', [[<leader>av]], [[<Cmd>lua require('jdtls').extract_variable()<CR>]])
  map('v', [[<leader>av]], [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]])
  map('v', [[<leader>am]], [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]])
  map('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]])
end

function M.setup()
  ui_extension()
  local config = {
    cmd = {'java-lsp'},
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach
  }

  require('jdtls').start_or_attach(config)
end

return M
