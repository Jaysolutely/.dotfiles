vim.g.mapleader = " "

local set = vim.keymap.set

-- Netrw shortcut
set("n", "<leader>pv", vim.cmd.Ex)

-- move selection
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- yank paste register utility
set({"n", "v"}, "<leader>p", [["_dP]])
set("n", "<leader>v", [["+p]])
set({"n", "v"}, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])set({"n", "v"}, "<leader>d", [["_d]])

-- start substitution for word under cursor
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
