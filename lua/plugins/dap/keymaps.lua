local M = {}
local map = require('utils').map
local array_includes = require('utils').array_includes
local dap = require('dap')
-- map('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
-- map('n', '<leader>dB', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- map('n', '<leader>d<space>', ':lua require("dap").continue()<CR>')

local function use_dap()
    local vimspector_files = {"typescript"}
    local filetype = vim.bo.filetype
    print(vimspector_files)
    local is_dap_compliant = not array_includes(vimspector_files, filetype)
    print(is_dap_compliant)
    return is_dap_compliant
end

local function toggle_breakpoint()
    local is_dap_compliant = use_dap()
    if (is_dap_compliant) then
        dap.toggle_breakpoint()
    else
        vim.api.nvim_exec([[ call vimspector#ToggleBreakpoint() ]], true)
    end
end

local function toggle_conditional_breakpoint()
    local is_dap_compliant = use_dap()
    local condition = vim.fn.input("Breakpoint condition: ")
    if (is_dap_compliant) then
        dap.toggle_breakpoint(condition)
    else
        vim.call("vimspector#ToggleBreakpoint", condition)
    end
end

local function continue()
    local is_dap_compliant = use_dap()
    if (is_dap_compliant) then
        dap.continue()
    else
        vim.api.nvim_exec([[ call vimspector#Continue() ]], true)
    end
end

vim.keymap.set('n', '<leader>db', toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', toggle_conditional_breakpoint)
vim.keymap.set('n', '<leader>d<space>', continue)

function M.setup()

end

return M
-- fun! GotoWindow(id)
--     call win_gotoid(a:id)
--     MaximizerToggle
-- endfun

-- " Debugger remaps
-- nnoremap <leader>m :MaximizerToggle!<CR>
-- nnoremap <leader>dd :call vimspector#Launch()<CR>
-- nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
-- nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
-- nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
-- nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
-- nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
-- nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
-- nnoremap <leader>de :call vimspector#Reset()<CR>

-- nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

-- nmap <leader>dl <Plug>VimspectorStepInto
-- nmap <leader>dj <Plug>VimspectorStepOver
-- nmap <leader>dk <Plug>VimspectorStepOut
-- nmap <leader>d_ <Plug>VimspectorRestart
-- nnoremap <leader>d<space> :call vimspector#Continue()<CR>

-- nmap <leader>drc <Plug>VimspectorRunToCursor
-- nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
-- nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
