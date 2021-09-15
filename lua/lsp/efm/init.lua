local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')
local eslint = require('lsp.efm.eslint')
local prettier = require('lsp.efm.prettier')
local lua_format = require('lsp.efm.lua-format')
local capabilities = require('lsp.capabilities')
local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm/config.yaml'
local efm_log_dir = '/tmp/'
local efm_root_markers = {
    '.zshrc', ".git/", '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json', '.eslintrc', 'package.json',
    '.prettierrc', '.prettierrc.js', '.prettierrc.json', '.prettierrc.json5', '.prettierrc.yaml', '.prettierrc.yml'
}

local efm_languages = {
    yaml = {prettier},
    json = {prettier},
    markdown = {prettier},
    javascript = {eslint},
    javascriptreact = {eslint},
    ["javascript.jsx"] = {eslint},
    typescript = {eslint},
    ["typescript.tsx"] = {eslint},
    typescriptreact = {eslint},
    css = {prettier},
    scss = {prettier},
    sass = {prettier},
    less = {prettier},
    graphql = {prettier},
    vue = {prettier},
    html = {prettier},
    lua = {lua_format}

}

lsp_config.efm.setup({
    capabilities = capabilities,
    cmd = {"efm-langserver", "-c", efm_config, "-logfile", efm_log_dir .. "efm.log"},
    filetype = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescript.tsx", "typescriptreact", 'lua'},
    on_attach = on_attach,
    root_dir = function(fname)
        local path = fname:gsub('Área de Trabalho', 'Desktop')
        return lsp_config.util.root_pattern(unpack(efm_root_markers))(path)
    end,
    init_options = {documentFormatting = false},
    settings = {rootMarkers = efm_root_markers, languages = efm_languages}
})
