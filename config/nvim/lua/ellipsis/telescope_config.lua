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
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>',{noremap=true})

-- map tags
vim.api.nvim_set_keymap('', '<leader>tag', '<cmd>lua require(\'telescope.builtin\').tags()<cr>',{noremap=true})
-- map command_history
vim.api.nvim_set_keymap('', '<leader>fch', '<cmd>lua require(\'telescope.builtin\').command_history()<cr>',{noremap=true})
-- map search history
vim.api.nvim_set_keymap('', '<leader>fsh', '<cmd>lua require(\'telescope.builtin\').search_history()<cr>',{noremap=true})
-- map help tags
vim.api.nvim_set_keymap('', '<leader>help', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>',{noremap=true})
-- map man_pages
vim.api.nvim_set_keymap('', '<leader>man', '<cmd>lua require(\'telescope.builtin\').man_pages()<cr>',{noremap=true})
-- map registers
vim.api.nvim_set_keymap('', '<leader>reg', '<cmd>lua require(\'telescope.builtin\').registers()<cr>',{noremap=true})
-- map maps
vim.api.nvim_set_keymap('', '<leader>map', '<cmd>lua require(\'telescope.builtin\').keymaps()<cr>',{noremap=true})
-- add github to telescope
local telescope = require('telescope')
telescope.load_extension('gh')
-- ultisnips
telescope.load_extension('ultisnips')
-- map snips
vim.api.nvim_set_keymap('', '<leader>snip', '<cmd>Telescope ultisnips ultisnips<cr>',{noremap=true})
