return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fazer fechamento automático de pares (parênteses, colchetes, aspas, etc)
  use 'jiangmiao/auto-pairs'

  -- Facilitar manipulação de 'surroundings' (pares)
  use 'tpope/vim-surround' 
 
  -- Adiciona comentários no código
  use 'numToStr/Comment.nvim'

  -- Plugin para repetir comandos com '.'
  use 'tpope/vim-repeat'

  use 'feline-nvim/feline.nvim'
  
  use 'kyazdani42/nvim-web-devicons'

  use 'kyazdani42/nvim-tree.lua'

  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  use 'nvim-treesitter/nvim-treesitter'

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
end)
