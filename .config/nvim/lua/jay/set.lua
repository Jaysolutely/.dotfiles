local set = vim.opt

-- general
set.mouse = "a"
set.termguicolors = true
set.ignorecase = true
set.smartcase = true
set.shell = "/bin/bash"
set.laststatus = 3
set.clipboard = "unnamedplus"
set.inccommand = "split"
set.swapfile = false
set.backup = false
set.undofile = true

-- editor
set.number = true
set.relativenumber = true

set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.expandtab = true

set.hlsearch = false
set.scrolloff = 10
set.signcolumn = "yes"
set.colorcolumn = "81"
set.cursorline = true
set.background = "dark"
set.splitbelow = true
set.splitright = true
set.showmatch = true
set.showbreak = "»"

-- folding
set.foldmethod = "indent"
set.foldenable = false
set.foldlevel = 99

-- window
set.title = true
set.titlestring = "%t NVIM"

-- autocomplete
set.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert', 'preview' }

-- set highlight on yank
vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank({timeout = 500})]]

-- disable auto-comment on o, O newline
local disableCommentContinuation = function()
  set.formatoptions:remove { 'o' }
end
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = disableCommentContinuation
})
disableCommentContinuation()
