local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require('lsp.capabilities')

lsp_config.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client)
    end,
    cmd = {"typescript-language-server", "--stdio"}
})
