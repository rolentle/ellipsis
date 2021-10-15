-- ensure that packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
return require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-github.nvim'
    use 'fhill2/telescope-ultisnips.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require('ellipsis.statusline') end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    --allow mass commenting
    use 'tpope/vim-commentary'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
     }

    -- lsp and nvim-cmp
    use 'neovim/nvim-lspconfig'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    --snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

-- ruby plugins
    -- use 'jgdavey/vim-blockle' -- TODO rewrite in tree siter
    -- use 'thoughtbot/vim-rspec' --TODO rewrite in lua w/minitest
    -- use 'vim-ruby/vim-ruby' -- TODO ensure treesitter can do this
    use 'tpope/vim-bundler'
    use 'tpope/vim-rails'
    use 'tpope/vim-rake'

-- "sql plugins
-- Plug 'exu/pgsql.vim'
-- Plug 'tpope/vim-dadbod'

-- "formating plugins
-- Plug 'AndrewRadev/splitjoin.vim' TODO rewrite with Tree Sitter
   use 'godlygeek/tabular'
-- Plug 'rondale-sc/vim-spacejam'
-- Plug 'tpope/vim-sleuth'
   use 'tpope/vim-surround'
-- " staticly check code and highlight errors (async syntastic replacement)
-- Plug 'w0rp/ale'

-- "tmux plugins
-- Plug 'jgdavey/tslime.vim'
-- Plug 'tpope/vim-dispatch'

-- "misc plugins
-- Plug 'tpope/vim-abolish'
-- Plug 'tpope/vim-endwise'
-- Plug 'tpope/vim-eunuch'
-- Plug 'leshill/vim-json'
-- Plug 'tpope/vim-markdown'
-- Plug 'tpope/vim-ragtag'
-- Plug 'kana/vim-textobj-user'
-- Plug 'tpope/vim-unimpaired'

-- git plugins
   use 'tpope/vim-fugitive'
-- Plug 'tpope/vim-git'
-- Plug 'tpope/vim-repeat'

  use 'editorconfig/editorconfig-vim'
  use 'vimwiki/vimwiki'
end)
