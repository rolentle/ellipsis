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

use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    -- config = function() require'my_statusline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
end)
