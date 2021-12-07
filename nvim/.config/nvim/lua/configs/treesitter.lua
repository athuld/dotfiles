require'nvim-treesitter.configs'.setup {
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
    "python",
    "javascript",
    "tsx",
    "typescript"
  },
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
  autopairs = {
    enable = true
  },
  autotag = {
    enable=true
  }
}
