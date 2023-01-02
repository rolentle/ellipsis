
return require("packer").startup(function(use)
    use 'nvim-telescope/telescope-github.nvim'
    use 'fhill2/telescope-ultisnips.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    -- use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- lsp and nvim-cmp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'

    --snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'mlaursen/vim-react-snippets'

-- ruby plugins
    -- use 'jgdavey/vim-blockle' -- TODO rewrite in tree siter
    use 'thoughtbot/vim-rspec'
    use 'vim-ruby/vim-ruby' -- TODO ensure treesitter can do this
    use 'tpope/vim-bundler'
    use 'tpope/vim-rails'
    use 'tpope/vim-rake'
    use 'ngmy/vim-rubocop'

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


  use 'editorconfig/editorconfig-vim'
  use 'elmcast/elm-vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
