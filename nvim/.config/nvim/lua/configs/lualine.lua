require('lualine').setup {
    extensions = {'nvim-tree', 'toggleterm'},
    options = {
        theme = 'material',
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
        disabled_filetypes = {'NvimTree'},
        globalstatus=true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
