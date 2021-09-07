local prettier = function()
    local path = vim.api.nvim_buf_get_name(0):gsub('Área de Trabalho', 'Desktop')
    return {exe = "prettier", args = {"--stdin-filepath", path}, stdin = true, cwd = vim.fn.expand("%:p:h")}
end

local eslint = function()
    local path = vim.api.nvim_buf_get_name(0):gsub('Área de Trabalho', 'Desktop')
    return {exe = "eslint_d", args = {"--stdin-filename", path}, stdin = false}
end

local lua_format = function()
    return {
        exe = "lua-format",
        args = {"-i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb"},
        stdin = true,
        cwd = vim.fn.expand("%:p:h")
    }
end

require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {prettier},
        javascriptreact = {prettier},
        typescript = {eslint, prettier},
        typescriptreact = {prettier},
        css = {prettier},
        less = {prettier},
        sass = {prettier},
        scss = {prettier},
        json = {prettier},
        graphql = {prettier},
        markdown = {prettier},
        vue = {prettier},
        yaml = {prettier},
        html = {prettier},
        lua = {lua_format}

    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.lua FormatWrite
augroup END
]], true)
