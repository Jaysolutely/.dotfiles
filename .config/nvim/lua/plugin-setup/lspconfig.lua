local set = vim.keymap.set
local buf = vim.lsp.buf
local opts = { noremap = true, silent = true }
set('n', '<space>e', vim.diagnostic.open_float, opts)
set('n', '[d', vim.diagnostic.goto_prev, opts)
set('n', ']d', vim.diagnostic.goto_next, opts)
set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  set('n', 'gD', buf.declaration, bufopts)
  set('n', 'gd', buf.definition, bufopts)
  set('n', 'K', buf.hover, bufopts)
  set('n', 'gi', buf.implementation, bufopts)
  set('n', '<C-k>', buf.signature_help, bufopts)
  set('n', '<space>wa', buf.add_workspace_folder, bufopts)
  set('n', '<space>wr', buf.remove_workspace_folder, bufopts)
  set('n', '<space>wl', function()
    print(vim.inspect(buf.list_workspace_folders()))
  end, bufopts)
  set('n', '<space>D', buf.type_definition, bufopts)
  set('n', '<space>rn', buf.rename, bufopts)
  set('n', '<space>ca', buf.code_action, bufopts)
  set('n', 'gr', buf.references, bufopts)
  set('n', '<space>f', function() buf.format({ async = true }) end, bufopts)
end

require 'lspconfig'.eslint.setup {
  on_attach = on_attach,
  settings = {
    format = true,
  }
}
require 'lspconfig'.intelephense.setup {
  on_attach = on_attach,
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
require 'lspconfig'.phpactor.setup {
  on_attach = on_attach,
}
require 'lspconfig'.vimls.setup {
  on_attach = on_attach,
}
require 'lspconfig'.tsserver.setup {
  on_attach = on_attach,
}
