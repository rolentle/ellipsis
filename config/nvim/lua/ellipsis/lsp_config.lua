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
nvim_lsp.solargraph.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  autoformat = true,
  diagnostics = true,
  formatting = true,
  loglevel = "debug",
  useBundler = true
}


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
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
