local set = vim.opt
-- general
set.exrc = true
set.mouse = "a"
set.termguicolors = true

-- editor
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true
set.scrolloff = 10
set.signcolumn = "yes"
set.colorcolumn = "80"
set.cursorline = true
set.background = "dark"
set.splitbelow = true
set.splitright = true
set.wrap = false
set.formatoptions:remove {"c", "r", "o"} -- no automatic comments

-- window
set.title = true
set.titlestring = "%t NVIM"

-- auto-complete
set.completeopt = "menu,menuone,noselect"

-- plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- tooling
Plug('nvim-lua/plenary.nvim')
-- theming
Plug('nvim-lualine/lualine.nvim')
Plug('ryanoasis/vim-devicons')
Plug('Mofiqul/vscode.nvim')
-- nvim-tree
Plug('kyazdani42/nvim-web-devicons')
Plug('kyazdani42/nvim-tree.lua')
-- lsp
Plug('williamboman/nvim-lsp-installer')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('jose-elias-alvarez/null-ls.nvim')
-- autocomplete
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-nvim-lsp')
-- treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
-- telescope
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.0'})
Plug('BurntSushi/ripgrep')
Plug('sharkdp/fd')
vim.call('plug#end')

-- plugin setup
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {"i", "s"}),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {"i", "s"}),

  },

  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
  },
})
require("nvim-tree").setup()
require('vscode').setup({
  italic_comments = true,
})
require('lualine').setup({
  options = {
    theme = 'onedark'
  },
  sections = {
    lualine_x = {},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  tabline = {
    lualine_a = { {
      'tabs',
      mode = 1
    } }
  }
})
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
    mappings = {
      n = {
        ['<C-x>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<C-h>'] = "which_key",
        ['<C-x>'] = require('telescope.actions').delete_buffer
      }
    }
  }
})
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "javascript", "css", "html", "typescript" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
require("nvim-lsp-installer").setup({
    automatic_installation = true,
})

-- keybinds
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- telescope keybinds
local opt = {
  noremap = true,
  silent = true,
}
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)

-- LSP setup
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

require'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  },
}
require'lspconfig'.eslint.setup{}
