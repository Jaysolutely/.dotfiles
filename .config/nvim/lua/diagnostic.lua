vim.diagnostic.config {
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  float = {
    format = function(dg)
      if dg.source == 'eslint' then
        return string.format('%s [%s]', dg.message, dg.user_data.lsp.code)
      end
      return string.format('%s [%s]', dg.message, dg.source)
    end,
    source = 'if_many',
    border = 'rounded',
    focusable = false,
    severity_sort = true,
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    max_width = 80,
    header = ""
  },
}

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(
    hl, { text = icon, numhl = hl, texthl = hl }
  )
end

lspSymbol('Error', '')
lspSymbol('Information', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')
