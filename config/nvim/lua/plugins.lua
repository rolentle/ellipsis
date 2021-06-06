return require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-github.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    -- holding off to a deeper dive
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     -- your statusline
    --     -- config = function() require'my_statusline' end,
    --     -- some optional icons
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true}
    -- }
    --allow mass commenting
    use 'tpope/vim-commentary'

    use 'kyazdani42/nvim-tree.lua'
    use 'tpope/vim-rails'

    -- lsp and completion
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'steelsojka/completion-buffers'
    use 'kristijanhusak/completion-tags'

    --snippets
    use { 'SirVer/ultisnips', require = {'honza/vim-snippets'} }
end)
