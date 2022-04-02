require'formatter'.setup ({
    filetype={
    text = {
        function()
            return{
                exe="sed",
                args={"-i 's/[ \t]*$//'"},
                stdin=false
            }
        end
    },
    html = {
      function()
        return {
          exe = "prettier",
          args = { '-w' },
          stdin = true
        }
      end
    },
    css = {
      function()
        return {
          exe = "prettier",
          args = { '-w' },
          stdin = true
        }
      end
    },
    scss = {
      function()
        return {
          exe = "prettier",
          args = { '-w' },
          stdin = true
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = "lua-format",
          args = { '-i' },
          stdin = true
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    javascriptreact = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    typescript = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    typescriptreact = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = "black", -- this should be available on your $PATH
          args = { '-' },
          stdin = true,
        }
      end
    },
    go = {
      function()
        return {
          exe = "golines",
          args = {"-w"},
          stdin = false
        }
      end
    },
    sh = {
        -- Shell Script Formatter
       function()
         return {
           exe = "shfmt",
           args = { "-i", 2 },
           stdin = true,
         }
       end,
   },
}})

