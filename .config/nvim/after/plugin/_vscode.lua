-- setup as first plugin or else will overwrite nvim-tree icon colors and lualine colors
require('vscode').setup({
	transparent = true,
	italic_comments = true,
	disable_nvimtree_bg = true,
})
