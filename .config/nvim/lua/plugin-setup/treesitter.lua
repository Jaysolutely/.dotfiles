require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "fish",
    "lua",
    "dockerfile",
    "markdown",
    "json",
    "rust",
    "html",
    "css",
    "javascript",
    "typescript",
    "jsdoc",
    "regex",
    "yaml",
    "vim",
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
