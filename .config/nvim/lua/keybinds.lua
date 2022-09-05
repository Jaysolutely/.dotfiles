vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local set = vim.keymap.set

-- diagnostics
local diagnostic = vim.diagnostic
set('n', '<leader>ee', diagnostic.open_float, opts)
set('n', '<leader>en', diagnostic.goto_prev, opts)
set('n', '<leader>ep', diagnostic.goto_next, opts)
set('n', '<leader>eq', diagnostic.setloclist, opts)

-- telescope
local telescope = require('telescope.builtin')
set('n', '<leader>ff', telescope.find_files, opts)
set('n', '<leader>fg', telescope.live_grep, opts)
set('n', '<leader>fb', telescope.buffers, opts)

-- nvim-tree
local tree = require('nvim-tree.api').tree
set('n', '<leader>tt', function() tree.toggle(true) end, opts)
set('n', '<leader>tf', function() tree.find_file(vim.fn.expand('%')) end, opts)

-- map key chord `jk` to <Esc>.
vim.cmd [[
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
]]
