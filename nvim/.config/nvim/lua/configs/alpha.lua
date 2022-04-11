local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())

local function pick_color()
    local colors = {"String", "Identifier", "Keyword", "Number"}
    return colors[math.random(#colors)]
end

local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

local logo = {
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡹⣿⣶⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⡿⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡈⠙⠻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⡿⠛⢛⣀⡀⠀⠀⠘⣿⡿⠿⣿⣦⠘⣿⡇⢀⡀⠀⠀⠀⣀⡀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⢀⡀⠀⠀⠿⠇⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⣿⣿⣿⠏⣠⣾⣿⢻⣿⡀⠀⠀⣿⣧⣤⣿⡿⠀⣿⡟⢻⣿⡆⣰⣿⠟⢻⣷⡄⣰⣿⣛⣻⣷⠈⣿⣷⠛⣿⣧⠈⣿⡇⠈⢿⣷⣼⡿⠁⠀",
"⠀⠀⠀⠀⠀⠀⠈⠉⠉⢁⣾⣿⡏⢰⣿⣿⠃⠀⣿⠇⠀⠀⣿⡇⠀⠀⠀⠀⣿⡇⢸⣿⡇⢻⣿⣄⣰⣿⡇⢿⣿⣛⣛⣛⠀⣿⣿⠀⣿⣿⠀⣿⡇⠀⣴⣿⣿⣦⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠀⢸⣿⣿⠀⠀⠏⠀⠀⠀⠛⠃⠀⠀⠀⠀⠛⠃⠈⠛⠃⠀⠉⠛⠛⠉⠀⠀⠙⠛⠛⠉⠀⠛⠛⠀⠛⠋⠀⠛⠃⠘⠛⠁⠈⠛⠃⠀",
"⠀⠀⣀⣀⣠⣤⣶⣿⣿⠿⠋⠀⠀⢸⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠈⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⣠⣿⢿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡏⠸⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡃⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    }

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
    dashboard.button("SPC c","  New file" ,"<CMD>ene!<CR>"),
    dashboard.button("SPC o", "  Recently opened files","<CMD>lua require('telescope.builtin').oldfiles()<CR>"),
    dashboard.button("; f", "  Find File","<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>"),
    dashboard.button("; g", "  Find Word","<CMD>lua require('telescope.builtin').live_grep()<CR>"),
    dashboard.button("SPC q", "  Quit", "<CMD>qa<CR>")
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
