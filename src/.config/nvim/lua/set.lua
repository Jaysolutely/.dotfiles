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
set.colorcolumn = "80"
set.cursorline = true
set.background = "dark"
set.splitbelow = true
set.splitright = true
set.wrap = false
set.showmatch = true

-- window
set.title = true
set.titlestring = "%t NVIM"

-- autocomplete
set.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
set.formatoptions:remove { "c", "r", "o" } -- no automatic comment expansion
