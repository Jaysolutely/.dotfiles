require("nvim-tree").setup({
--git = {
--  ignore = false
--},
  filters = {
    custom = { "^\\.git$" }
  }
})
