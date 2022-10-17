local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
   print('Installing packer...')
   local packer_url = 'https://github.com/wbthomason/packer.nvim'
   vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
   print('Done.')

   vim.cmd('packadd packer.nvim')
   install_plugins = true
end

require('packer').startup(function(use)

   use "wbthomason/packer.nvim"
   use 'sheerun/vim-polyglot'
   use 'windwp/nvim-autopairs'
   use 'windwp/nvim-ts-autotag'
   use 'dyng/ctrlsf.vim'
   use 'kyazdani42/nvim-tree.lua'
   use 'tpope/vim-commentary'
   use 'akinsho/bufferline.nvim'
   use 'akinsho/toggleterm.nvim'
   -- use 'puremourning/vimspector'
   use 'tpope/vim-fugitive'
   use 'jiangmiao/auto-pairs'
   use 'tpope/vim-surround'
   use 'farmergreg/vim-lastplace'
   use 'wakatime/vim-wakatime'
   use 'tpope/vim-repeat'

   use 'mfussenegger/nvim-dap'
   use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
   -- Theme
   use 'sfi0zy/atlantic-dark.vim'
   use 'owickstrom/vim-colors-paramount'
   use 'morhetz/gruvbox'
   use 'ayu-theme/ayu-vim'
   use 'bluz71/vim-moonfly-colors'
   use 'srcery-colors/srcery-vim'
   use 'drewtempelmeyer/palenight.vim'
   use 'franbach/miramare'
   use 'sainnhe/everforest'
   use {'dracula/vim', as = 'dracula'}
   use {'pineapplegiant/spaceduck', branch = 'main' }
   use "cpea2506/one_monokai.nvim"
   use "challenger-deep-theme/vim"
   use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

   -- Airline
   use 'vim-airline/vim-airline'
   use 'vim-airline/vim-airline-themes'

   use {'styled-components/vim-styled-components',  branch = 'main' }
   use 'yuttie/comfortable-motion.vim'
   use 'kyazdani42/nvim-web-devicons'
   use 'onsails/lspkind.nvim'
   use 'matze/vim-move'

   use 'nvim-lua/plenary.nvim'
   use 'nvim-telescope/telescope.nvim'
   use 'nvim-treesitter/nvim-treesitter'

   use {'prettier/vim-prettier',  run = 'npm ci'}
   use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

   -- LSPs
   use 'neovim/nvim-lspconfig'
   use 'jose-elias-alvarez/nvim-lsp-ts-utils'
   use 'jose-elias-alvarez/null-ls.nvim'
   use 'williamboman/nvim-lsp-installer'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lua'
   use 'saadparwaiz1/cmp_luasnip'
   use 'hrsh7th/cmp-nvim-lsp-signature-help'
   use 'ray-x/cmp-treesitter'

   use 'rafamadriz/friendly-snippets'
   use {"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"}

   if install_plugins then
      require('packer').sync()
   end
end)

if install_plugins then
   return
end
