local emmet_opt = {javascript = {extends = 'jsx'}}

vim.g.user_emmet_settings = emmet_opt

-- Emmet tab complete setup
vim.api.nvim_exec([[
  function! s:expand_html_tab()
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
  if emmet#isExpandable()
    return emmet#expandAbbrIntelligent("\<tab>")
    " return "\<C-y>,"
  endif
  return "\<tab>"
  endfunction

autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown.mdx imap <silent><buffer><expr><tab> <sid>expand_html_tab()
let g:user_emmet_mode='a'
let g:user_emmet_complete_tag = 0
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown.mdx EmmetInstall
]], false)
