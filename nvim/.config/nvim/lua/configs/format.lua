require'format'.setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    html = {{cmd = {"prettierd -w"}}},
    css = {{cmd = {"prettierd -w"}}},
    scss = {{cmd = {"prettierd -w"}}},
    json = {{cmd = {"prettierd -w"}}},
    lua = {{cmd = {"lua-format -i"}}},
    javascript = {{cmd = {"prettierd -w", "./node_modules/.bin/eslint --fix"}}},
    javascriptreact = {
        {cmd = {"prettierd -w", "./node_modules/.bin/eslint --fix"}}
    },
    typescript = {{cmd = {"prettierd -w", "./node_modules/.bin/eslint --fix"}}},
    typescriptreact = {
        {cmd = {"prettierd -w", "./node_modules/.bin/eslint --fix"}}
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

