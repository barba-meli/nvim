local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

lsp_config.yamlls.setup({
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client)
    end
})
