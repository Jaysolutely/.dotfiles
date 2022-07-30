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
Plug('neovim/nvim-lspconfig')
Plug('williamboman/nvim-lsp-installer')
Plug('jose-elias-alvarez/null-ls.nvim')

-- autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug('hrsh7th/nvim-cmp')
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

-- treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'jwalton512/vim-blade'

-- telescope
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('BurntSushi/ripgrep')
Plug('sharkdp/fd')

-- mini
Plug('echasnovski/mini.nvim')


vim.call('plug#end')


-- PLUGIN SETUP

require("plugin-setup.lualine")
require("plugin-setup.vscode")
require("plugin-setup.nvim-tree")
require("plugin-setup.lsp-installer")
require("plugin-setup.lspconfig")
-- require("plugin-setup.null-ls")
require("plugin-setup.cmp")
require("plugin-setup.treesitter")
require("plugin-setup.telescope")
require("plugin-setup.mini")
