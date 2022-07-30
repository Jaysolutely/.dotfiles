require 'lspconfig'.eslint.setup {
  settings = {
    format = true,
  }
}
require 'lspconfig'.intelephense.setup {
}
require 'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
}
require'lspconfig'.phpactor.setup{}
