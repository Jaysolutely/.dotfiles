require("nvim-tree").setup({
--git = {
--  ignore = false
--},
  filters = {
    custom = { "^\\.git$" }
  }
})
vim.cmd([[:highlight NvimTreeNormal guibg=transparent]])
