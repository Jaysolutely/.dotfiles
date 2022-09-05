require('lualine').setup({
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {'require"lsp-status".status()'},
    lualine_c = {{
      'filename',
      path = 1,
      shorting_target = 60
    }},
    lualine_x = { 'filetype', 'location' },
    lualine_y = {},
    lualine_z = {}
  },
})
