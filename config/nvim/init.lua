-- set numbers on the side
vim.o.number = true

-- new vertical split buffers open on the right
vim.o.splitright= true

-- new horizontal split buffers open below
vim.o.splitbelow = true

-- ignorecase when searching
vim.o.ignorecase = true
--highlight search phrase
vim.o.hlsearch = true

--set leader key to ","
vim.g.mapleader=","

-- it hides the buffer instead closes it
vim.o.hidden = true

--create column 72 characters out of different color
vim.g.colorcolumn = 72

--tab indents 4 characters
vim.o.tabstop = 4
--auto indents 4 characters
vim.o.shiftwidth = 4
--converts tab into spaces
vim.o.expandtab = true

-- turn terminal to normal mode with escape
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>',{noremap = true})

-- <C-[JKLH]> select buffer
for _, direction in ipairs({'J', 'K', 'L', 'H'}) do
    local key = string.format("<C-%s>", direction)
    local result = string.format("<C-W><C-%s>",direction)
    vim.api.nvim_set_keymap('n',key,result, {noremap=true})
end

-- ensure that packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
require("plugins")

--colorscheme
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- telescope shortcuts
-- map telescope to crtl+p
vim.api.nvim_set_keymap('', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap=true})
vim.api.nvim_set_keymap('', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap=true})
vim.api.nvim_set_keymap('', '<leader>gst', '<cmd>Telescope git_status<cr>', {noremap=true})

function _G.find_dotfiles()
    local Path = require('plenary.path')
    local dotfile_dir = Path:new(vim.env.HOME, "code/ellipsis"):absolute()

    return require('telescope.builtin').find_files({search_dirs={dotfile_dir}})
end

vim.api.nvim_set_keymap('', '<leader>fd', '<cmd>lua find_dotfiles()<cr>', {noremap=true})


--map leader a to grep selected word
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua require(\'telescope.builtin\').grep_string()<cr>',{noremap=true})
-- add github to telescope
require('telescope').load_extension('gh')

require'nvim-treesitter.configs'.setup({
  highlight = { enable = true },
  indent = { enable = true }
})

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
vim.g.UltiSnipsExpandTrigger="<leader><Tab>"

vim.api.nvim_set_keymap('', '<leader>n', '<cmd>NvimTreeToggle<cr>', {noremap = true})
