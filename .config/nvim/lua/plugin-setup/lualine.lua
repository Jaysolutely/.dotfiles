require('lualine').setup({
  options = {
    theme = 'codedark',
  },
  sections = {
    lualine_c = {{
      'filename',
      path = 1,
      shorting_target = 60
    }},
    lualine_x = { 'filetype' },
    lualine_y = {},
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { {
      'tabs',
      mode = 1
    } }
  }
})
