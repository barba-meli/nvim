local wk = require("which-key")

-- wk.register({
--     ["<leader>"] = {
--         f = {name = "Finder", b = {"Buffers"}, f = {"Files"}, g = {"Live Grep"}, h = {"Help Tags"}, l = {"LSP ref"}},
--         a = {name = "Tabs", h = {"Move to previous tab"}, l = {"Move to next tab"}, q = {"Close tab"}},
--         c = {
--             name = "Terminal (console)",
--             q = {"Close terminal when in insert mode"},
--             t = {"Create a new tab with a terminal"},
--             c = {"Go to normal mode in terminal"},
--             v = {"Open a terminal in a vertical split"},
--             h = {"Open a terminal in a horizontal split"}

--         },
--         t = {name = "Tests", n = {"Test nearest"}, f = {"Test file"}, s = {"Test Suite"}, l = {"Test Last"}, v = {"Test visit"}},
--         u = {"UndoTree"},
--         rn = {"Rename"},
--         h = {"Move to left split"},
--         j = {"Move to split below"},
--         k = {"Move to split above"},
--         l = {"Move to right split"},
--         pv = {"Project View"},
--         d = {
--             name = "debug",
--             d = {"open debugger"},
--             q = {"quit debugger"},
--             ccb = {"clear breakpoints"},
--             l = {"step into"},
--             j = {"step over"},
--             k = {"step out"},
--             _ = {"Restart"},
--             ["d<space>"] = {"continue"},
--             rc = {"Run to cursor"},
--             b = {"Toggle breakpoint"},
--             B = {"Toggle conditional breakpoint"}

--         }
--     },
--     ["<C-_>"] = {"Comment"}
-- })

return wk
