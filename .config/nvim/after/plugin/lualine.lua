require('lualine').setup({
  options = {
    theme = 'vscode',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = { {
      'mode',
      fmt = function(str) return str:sub(1, 1) end
    } },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { {
      'filename',
      path = 1,
      shorting_target = 60
    } },
    lualine_x = {
      { 'filetype', colored = true },
      'location'
    },
    lualine_y = {},
    lualine_z = {}
  },
})
