-- setup as first plugin or else will overwrite nvim-tree icon colors and lualine colors
require('vscode').setup({
	transparent = true,
	italic_comments = true,
	disable_nvimtree_bg = true,
})

-- cmp highlights
vim.cmd('highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080')
vim.cmd('highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6')
vim.cmd('highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch')
vim.cmd('highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! link CmpItemKindInterface CmpItemKindVariable')
vim.cmd('highlight! link CmpItemKindText CmpItemKindVariable')
vim.cmd('highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0')
vim.cmd('highlight! link CmpItemKindMethod CmpItemKindFunction')
vim.cmd('highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4')
vim.cmd('highlight! link CmpItemKindProperty CmpItemKindKeyword')
vim.cmd('highlight! link CmpItemKindUnit CmpItemKindKeyword')
vim.cmd('highlight! PmenuSel guibg=#4D4D4D guifg=NONE')

