local M = {}

function M.setup()

    local dap = require "dap"
    dap.set_log_level('TRACE');
    dap.adapters['node-terminal'] = {
        type = "executable",
        name = "node-terminal",
        command = "node",
        args = {"/home/barba/Downloads/conf/vscode-js-debug/out/src/flatSessionLauncher.js"}
    }

    dap.configurations.javascript = {
        {
            type = "node-terminal",
            request = "launch",
            name = "Launch Program",
            program = '${file}'
            -- program = vim.api.nvim_eval("expand('%:p')"),
        }
    }

    dap.configurations.typescript = {
        {
            type = "node-terminal",
            request = "attach",
            name = "Launch Program",
            program = '${file}'
            -- program = vim.api.nvim_eval("expand('%:p')"),
        }, {
            type = "node-terminal",
            request = "launch",
            name = "Launch Program",
            program = '${file}'
            -- program = vim.api.nvim_eval("expand('%:p')"),
        }
    }

end

return M
