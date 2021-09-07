local map = require('utils').map

local options = {noremap = true}

map('n', '<leader>h', "<C-w>h")
map('n', '<leader>j', "<C-w>j")
map('n', '<leader>k', "<C-w>k")
map('n', '<leader>l', "<C-w>l")

map('n', '<leader><space>', ':nohlsearch<cr>', options)
