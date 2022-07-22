-- local map = require('utils').map
vim.cmd([[ let test#strategy = "neovim" ]])

-- local options = {noremap = true}

-- map('n', '<leader>tn', ":TestNearest <cr>")
-- map('n', '<leader>tf', ":TestFile <cr>")
-- map('n', '<leader>ts', ":TestSuite <cr>")
-- map('n', '<leader>tl', ":TestLast <cr>")
-- map('n', '<leader>tv', ":TestVisit <cr>")

-- vim.keymap.set('n', '<leader>tt', function() require"jester".run() end)
-- vim.keymap.set('n', '<leader>t_', function() require"jester".run_last() end)
-- vim.keymap.set('n', '<leader>tf', function() require"jester".run_file() end)
-- vim.keymap.set('n', '<leader>d_', function() require"jester".debug_last() end)
-- vim.keymap.set('n', '<leader>df', function() require"jester".debug_file() end)
-- vim.keymap.set('n', '<leader>dq', function() require"jester".terminate() end)
-- vim.keymap.set('n', '<leader>dd', function() require"jester".debug() end)

-- vim.g["test#neovim#start_normal"] = 1
-- vim.g["test#preserve_screen"] = 1

local wk = require('plugins.whichkey')

wk.register({
    t = {
        name = "Test",
        n = {":TestNearest <cr>", "Test nearest"},
        f = {":TestFile <cr>", "Test file"},
        s = {":TestSuite <cr>", "Test suite"},
        l = {":TestLast <cr>", "Test last"},
        v = {":TestVisit <cr>", "Visit"}
    }
}, {prefix = "<leader>", mode = "n"})

local builders = {
    python = function(cmd)
        local non_modules = {"python", "pipenv", "poetry"}

        local module_index
        if vim.tbl_contains(non_modules, cmd[1]) then
            module_index = 3
        else
            module_index = 1
        end

        local args = vim.list_slice(cmd, module_index + 1)

        return {dap = {type = "python", name = "Ultest Debugger", request = "launch", module = cmd[module_index], args = args, justMyCode = false}}
    end,
    ["go#richgo"] = function(cmd)
        local args = {}

        for i = 3, #cmd, 1 do
            local arg = cmd[i]
            if vim.startswith(arg, "-") then arg = "-test." .. string.sub(arg, 2) end
            args[#args + 1] = arg
        end
        print(vim.inspect(args))
        return {
            dap = {type = "go", request = "launch", mode = "test", program = "${workspaceFolder}", dlvToolPath = vim.fn.exepath("dlv"), args = args},
            parse_result = function(lines)
                return lines[#lines] == "FAIL" and 1 or 0
            end
        }
    end,
    ["typescript"] = function(cmd)
        return {
            dap = {

                type = "node-terminal",
                request = "launch",
                name = "Launch Program",
                program = '${file}'
                -- program = vim.api.nvim_eval("expand('%:p')"),
            }
        }

    end,
    ["javascript"] = function(cmd)
        return {
            dap = {

                type = "node-terminal",
                request = "launch",
                name = "Launch Program",
                program = '${file}'
                -- program = vim.api.nvim_eval("expand('%:p')"),
            }
        }

    end
}
require("ultest").setup({builders = builders})
