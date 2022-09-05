local set = vim.keymap.set
local buf = vim.lsp.buf

local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr, nowait = true }
  set('n', 'gD', buf.declaration, bufopts)
  set('n', 'gd', buf.definition, bufopts)
  set('n', 'K', buf.hover, bufopts)
  set('n', 'gi', buf.implementation, bufopts)
  set('n', '<leader>D', buf.type_definition, bufopts)
  set('n', '<leader>ca', buf.code_action, bufopts)
  set('n', 'gr', buf.references, bufopts)
  set('n', '<leader>fx', function() buf.format({ async = true }) end, bufopts)
end

require 'lspconfig'.eslint.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    on_attach(client, bufnr)
  end,
}
require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  },
}
require 'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,
}
