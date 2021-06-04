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
end)
