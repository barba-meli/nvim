local apply_colorscheme = require('utils').apply_colorscheme

-- vim.api.nvim_exec([[
--   augroup qs_colors
--   autocmd!
--     autocmd ColorScheme * highlight QuickScopePrimary guifg='#5f8cff' gui=underline ctermfg=155 cterm=underline
--     autocmd ColorScheme * highlight QuickScopeSecondary guifg='#f75fff' gui=underline ctermfg=81 cterm=underline
--   augroup END
-- ]], true)

apply_colorscheme("gruvbox", "dark")
