local buf_map = require('utils').buf_map
local buf_option = require('utils').buf_option

local wk = require("plugins.whichkey")

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then return end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then vim.api.nvim_command("noautocmd :update") end
  end
end

local function on_attach(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_exec([[
          augroup Format
          autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = false})
          augroup END
      ]], true)
  end

  buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  wk.register({
    g = {
      name = "Go to",
      d = { "Go to declaration" },
      D = { "Go to definition" },
      t = { "Go to type definition" },
      i = { "Go to type implementation" },
      r = { "Go to references" }
    },
  }, { mode = "n", buffer = bufnr })
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  -- buf_map('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  buf_map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  -- buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)


  wk.register({
    K = { "Hover" },
  }, { mode = "n", buffer = bufnr })
  buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

  wk.register({
    K = { "Show signature help" },
  }, { prefix = "<leader>", mode = "n", buffer = bufnr })
  buf_map('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

  wk.register({ ["<c-K>"] = { "Show signature help" } }, { mode = "i", buffer = bufnr })
  buf_map('i', '<c-K>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

  -- buf_map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  -- buf_map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  -- buf_map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)

  wk.register({
    rn = { "Rename" },
    ca = { "Code actions" },
    f = { "Format file" },
  }, { prefix = "<leader>", mode = "n", buffer = bufnr })

  buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = false})<cr>', opts)

  wk.register({
    ["[d"] = { "Go to prev diagnostic" },
    ["]d"] = { "Go to next diagnostic" },
    ["<leader>d"] = { "Show line diagnostic" },
    ["<leader>q"] = { "Set diagnostic in loclist" },
  }, { mode = "n", buffer = bufnr })
  buf_map('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float({scope="buffer"})<cr>', opts)
  buf_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  buf_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  -- buf_map('n', '<leader>q', '<cmd>lua vim.diagnostic.set_loclist()<cr>', opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


  buf_map('i', '<tab>', 'pumvisible() ? "<c-n>" : "<tab>"', { expr = true, noremap = true })
  buf_map('i', '<s-tab>', 'pumvisible() ? "<c-p>" : "<s-tab>"', { expr = true, noremap = true })
end

return on_attach
