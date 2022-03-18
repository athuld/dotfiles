require'format'.setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    html = {{cmd = {"prettier -w"}}},
    css = {{cmd = {"prettier -w"}}},
    scss = {{cmd = {"prettier -w"}}},
    json = {{cmd = {"prettier -w"}}},
    lua = {{cmd = {"lua-format -i"}}},
    javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    javascriptreact = {
        {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
    },
    typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    typescriptreact = {
        {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
    },
    python = {
        {
            cmd = {
                function(file)
                    return string.format('black --quiet %s', file)
                end
            }
        }
    },
    go = {{cmd = {"golines -w"}}},
    sh = {{cmd = {"shfmt -l -w"}}}
}

