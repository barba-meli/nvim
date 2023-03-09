local capabilities = require "lsp.capabilities"
local on_attach    = require "lsp.on_attach"
local lsp          = vim.lsp
local fn           = vim.fn

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics,
  { underline = true, virtual_text = { prefix = "●", spacing = 4 } })

fn.sign_define("LspDiagnosticsSignError", { text = "X", numhl = "LspDiagnosticsDefaultError" })
fn.sign_define("LspDiagnosticsSignWarning", { text = "!", numhl = "LspDiagnosticsDefaultWarning" })
fn.sign_define("LspDiagnosticsSignInformation", { text = "⁈", numhl = "LspDiagnosticsDefaultInformation" })
fn.sign_define("LspDiagnosticsSignHint", { text = "▲", numhl = "LspDiagnosticsDefaultHint" })


local servers = {
  bashls = {},
  cssls = {},
  dockerls = {},
  gopls = {
    cmd = { 'gopls', '--remote=auto' },
    capabilties = {
      textDocuemnt = {
        completion = {
          completionItem = {
            snippetSupport = true
          }
        }
      }
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true
    }
  },
  html = {},
  jsonls = {},
  lua_ls= {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
      },
      diagnostics = { enable = true,
        globals = { "vim", "describe", "it", "before_each", "after_each", "awesome", "theme", "client" } }
    }
  },
  tsserver = {},
  yamlls = {}
}

require("mason").setup {}

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
-- require("mason-lspconfig").setup {
--   ensure_installed = vim.tbl_keys(servers),
--   automatic_installation = false
-- }

-- require('lsp.bash')
-- require('lsp.css')
-- require('lsp.docker')
-- require('lsp.go')
-- require('lsp.efm')
-- require('lsp.html')
-- require('lsp.json')
-- require('lsp.lua')
-- require('lsp.php')
-- require('lsp.ts')
-- require('lsp.vim')
-- require('lsp.yaml')
