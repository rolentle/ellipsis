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

-- map telescope to crtl+p
vim.api.nvim_set_keymap('', '<C-p>', '<cmd>Telescope find_files<cr>', {noremap=true})

--map leader a to grep selected word
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua require(\'telescope.builtin\').grep_string()<cr>',{noremap=true})
-- add github to telescope
require('telescope').load_extension('gh')

require'nvim-treesitter.configs'.setup({
  highlight = { enable = true },
  indent = { enable = true }
})
