vim.g.completeopt='menu,menuone,noselect'
-- Setup nvim-cmp.
-- local cmp = require'cmp'

-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       -- For `vsnip` user.
--       -- vim.fn["vsnip#anonymous"](args.body)

--       -- For `luasnip` user.
--       -- require('luasnip').lsp_expand(args.body)

--       -- For `ultisnips` user.
--       vim.fn["UltiSnips"](args.body)
--     end,
--   },
--   mapping = {
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.close(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),

--   },
--   sources = {
--     { name = 'nvim_lsp' },

--     -- For vsnip user.
--     -- { name = 'vsnip' },

--     -- For luasnip user.
--     -- { name = 'luasnip' },

--     -- For ultisnips user.
--     { name = 'UltiSnips' },

--     { name = 'buffer' },
--     { name = 'path' },
--   }
-- })
--ruby lsp
local nvim_lsp = require'lspconfig'
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

nvim_lsp.solargraph.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  autoformat = true,
  diagnostics = true,
  formatting = true,
  loglevel = "debug",
  useBundler = true
}


local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
	flags = {
	  debounce_text_changes = 150,
	}
  }
end

--sorbet lspconfig
-- require'lspconfig'.sorbet.setup{}

-- rust lsp
nvim_lsp.rust_analyzer.setup({})

nvim_lsp.elmls.setup({root_dir = require("lspconfig.util").root_pattern('hubtran/hubtran-web/client/elm/accounts-payable/elm.json')})
