local fn = vim.fn
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

--tab indents 2 characters
vim.o.tabstop = 2
--auto indents 2 characters
vim.o.shiftwidth = 2
--converts tab into spaces
vim.o.expandtab = true

vim.cmd[[syntax on]]

-- turn terminal to normal mode with escape
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>',{noremap = true})

-- <C-[JKLH]> select buffer
for _, direction in ipairs({'J', 'K', 'L', 'H'}) do
    local key = string.format("<C-%s>", direction)
    local result = string.format("<C-W><C-%s>",direction)
    vim.api.nvim_set_keymap('n',key,result, {noremap=true})
end

require("plugins")
require("ellipsis.telescope_config")

--colorscheme
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


require'nvim-treesitter.configs'.setup({
    ensure_installed = { "ruby", "lua", "rust", "javascript", "make", "markdown", "json", "html", "elm"},
    auto_install = true,
})
require("ellipsis.lsp_config")
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

vim.g.vimwiki_list = { {['path'] = '~/rolens_notes/', ['syntax'] = 'markdown', ['ext'] = '.md'}}
vim.api.nvim_set_keymap('', '<leader>n', '<cmd>NvimTreeToggle<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>gh', '<cmd>GBrowse<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>t', '<cmd>call RunCurrentSpecFile()<cr>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>T', '<cmd>call RunNearestSpec()<cr>', {noremap = true})
vim.g.rspec_command= "!bin/drspec {spec}"

