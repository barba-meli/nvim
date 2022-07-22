local wk = require('plugins.whichkey')
local map = require('utils').map

map('t', '<leader>cc', "<C-\\><C-n><cr>")

wk.register({
    c = {
        name = "Terminal (console)",
        h = {"<cmd>split | terminal<cr><cmd>resize 15<cr>", "Open a terminal in a horizontal split"},
        v = {":vsplit | terminal<cr>:vertical resize 40<cr>", "Open a terminal in a vertical split"},
        t = {":tabnew | terminal<cr>", "Create a new tab with a terminal"}
    },
    a = {
        name = "Tabs",
        h = {":tabprevious<cr>", "Move to previous tab"},
        l = {":tabnext<cr>", "Move to next tab"},
        q = {":tabclose<cr>", "Close tab"}
    },
    m = {":MaximizerToggle! <CR>", "Toggle maximizer"},
    h = {"<C-w>h", "Move to left split"},
    j = {"<C-w>j", "Move to split below"},
    k = {"<C-w>k", "Move to split above"},
    l = {"<C-w>l", "Move to right split"},
    ["<space>"] = {":nohlsearch<CR>", "Clear search"}
}, {prefix = "<leader>", mode = "n"})

wk.register({
    c = {
        name = "Terminal (console)",
        q = {"<Esc> <C-\\><C-n><cmd>q!<cr>", "Close terminal when in insert mode"},
        c = {"Go to normal mode in terminal"}
    }
}, {prefix = "<leader>", mode = "t"})
