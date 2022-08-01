local set = vim.opt

-- general
set.exrc = true
set.mouse = "a"
set.termguicolors = true
set.ignorecase = true
set.smartcase = true
set.shell = "/bin/bash"
set.laststatus = 3 -- global statusline
set.clipboard = "unnamedplus"
set.inccommand = "split"

-- editor
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true
set.hlsearch = false
set.scrolloff = 10
set.signcolumn = "yes"
set.colorcolumn = "81"
set.cursorline = true
set.background = "dark"
set.splitbelow = true
set.splitright = true
set.wrap = false
set.showmatch = true

-- folding
set.foldmethod = "indent"
set.foldenable = false
set.foldlevel = 99

-- window
set.title = true
set.titlestring = "%t NVIM"

-- autocomplete
set.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
local disableCommentContinuation = function() set.formatoptions:remove { 'c', 'r', 'o' } end
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = disableCommentContinuation
})
disableCommentContinuation()
