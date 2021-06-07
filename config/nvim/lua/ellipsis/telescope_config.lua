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
