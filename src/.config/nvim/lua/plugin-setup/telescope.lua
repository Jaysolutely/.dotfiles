require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
    mappings = {
      n = {
        ['<C-x>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<C-h>'] = "which_key",
        ['<C-x>'] = require('telescope.actions').delete_buffer
      }
    }
  }
})
