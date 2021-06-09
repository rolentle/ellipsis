--ruby lsp
require'lspconfig'.solargraph.setup{on_attach=require('completion').on_attach}

-- nvim-lua/completion-nvim recommended setting
-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap( 'i', '<expr> <Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {noremap=true})

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
-- TODO figure out how this works
-- Research :keycodes, expr-quote, nvim_replace_termcodes
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_s_tab()
    return fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

-- TODO research what v:luia does
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_s_tab()', {expr = true, noremap = true})

vim.g.completion_enable_auto_popup = 0
vim.api.nvim_set_keymap('i','<tab>', '<Plug>(completion_smart_tab)',{})
-- Set completeopt to have a better completion experience
vim.g.completeopt='menuone,noinsert,noselect'
--Avoid showing message extra message when using completion
vim.cmd('set shortmess+=c')

vim.cmd("let g:completion_chain_complete_list = [{'complete_items': [ 'buffers', 'snippet', 'lsp', 'tags']},{'mode': '<c-p>'}, {'mode': '<c-n>'}]")

vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.UltiSnipsExpandTrigger="<M-Tab>"

vim.api.nvim_set_keymap('', '<leader>n', '<cmd>NvimTreeToggle<cr>', {noremap = true})
