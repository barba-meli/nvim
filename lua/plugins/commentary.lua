local options = {}
vim.api.nvim_set_keymap('n', '<C-_>', 'gc <CR>', options)
vim.api.nvim_set_keymap('v', '<C-_>', 'gc <CR>', options)
local wk = require('plugins.whichkey')

wk.register({['<C-_>'] = {"Comment"}}, {mode = "n"})
wk.register({['<C-_>'] = {"Comment"}}, {mode = "v"})
