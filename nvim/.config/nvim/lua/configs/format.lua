require'format'.setup {
  ["*"] = {
    {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
  },
  html = {{cmd = {"prettier -w"}}},
  css = {{cmd = {"prettier -w"}}},
  scss = {{cmd = {"prettier -w"}}},
  json = {{cmd = {"prettier -w"}}},
  lua = {
    {
      cmd = {
        function(file)
          return string.format(
                     'lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --indent-width=2 %s',
                     file)
        end
      }
    }
  },
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  python = {
    {
      cmd = {
        function(file)
          return string.format('black --quiet %s', file)
        end
      }
    }
  },
}

