local buf_map = require('utils').buf_map
local buf_option = require('utils').buf_option

local wk = require("plugins.whichkey")

wk.register({
    g = {
        name = "Go to",
        D = {"Go to declaration"},
        d = {"Go to definition"},
        t = {"Go to type definition"},
        i = {"Go to type implementation"},
        r = {"Go to references"}
    },
    K = {"Hover"},
    ["<C-K>"] = {"Show signature help"},
    ["[d"] = {"Go to prev diagnostic"},
    ["]d"] = {"Go to next diagnostic"}
}, {mode = "n"})

wk.register({
    K = {"Show signature help"},
    rn = {"Rename"},
    ca = {"Code actions"},
    d = {"Show line diagnostic"},
    -- f = {"Format file"},
    q = {"Set diagnostic in loclist"},
    w = {name = "Workspace", a = {"Add Workspace"}, r = {"Remove Workspace"}, l = {"List Workspace"}}
}, {prefix = "<leader>", mode = "n"})

wk.register({["<C-K>"] = {"Show signature help"}}, {mode = "i"})

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then vim.api.nvim_command("noautocmd :update") end
    end
end

local function on_attach(client)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end

    buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}

    buf_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_map('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map('i', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_map('n', '<leader>d', '<cmd>lua vim.diagnostic.show_line_diagnostics({ show_header = false })<CR>', opts)
    buf_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_map('n', '<leader>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
    buf_map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', opts)
    buf_map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true, noremap = true})
    buf_map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true, noremap = true})
end

return on_attach
