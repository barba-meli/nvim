local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path2 = vim.fn.fnamemodify(sumneko_binary_path, ':h')
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')
local capabilities = require("lsp.capabilities")

lsp_config.sumneko_lua.setup({
  capabilities = capabilities,
  -- cmd = {sumneko_binary_path, "-E", sumneko_root_path2 .. "/main.lua"},
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path
      },
      diagnostics = { enable = true,
        globals = { "vim", "describe", "it", "before_each", "after_each", "awesome", "theme", "client" } }
    }
  }
})
