-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  },
})

lsp.ensure_installed({
  "tsserver",
  "sumneko_lua",
  "rust_analyzer",
})

local cmp = require("cmp")

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local behavior_select = { behavior = cmp.SelectBehavior.Select }
-- local behavior_insert = { behavior = cmp.SelectBehavior.Insert }

lsp.setup_nvim_cmp({
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(behavior_select),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(behavior_select),
    ["<C-q>"] = cmp.mapping.abort(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  formatting = {
    fields = { "abbr", "kind" },
    format = function(_, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  },
})

local disable_formatting_for_lsp = { "html", "tsserver" }
local function disable_client_formatting(client)
  for _, value in ipairs(disable_formatting_for_lsp) do
    if client.name == value then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentFormattingRangeProvider = false
    end
  end
end

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local set = vim.keymap.set
  disable_client_formatting(client)
  set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  set("n", "<leader>ee", function()
    vim.diagnostic.open_float()
  end, opts)
  set("n", "<leader>en", function()
    vim.diagnostic.goto_next()
  end, opts)
  set("n", "<leader>ep", function()
    vim.diagnostic.goto_prev()
  end, opts)
  set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts)
  set("n", "<leader>rf", function()
    vim.lsp.buf.references()
  end, opts)
  set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end, opts)
  set("n", "<leader>fx", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
})

-- using automatic setup from mason-null-ls (just install in mason)
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
  -- debug = true,
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    -- You can add tools not supported by mason.nvim
  },
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  automatic_setup = true,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup_handlers()
