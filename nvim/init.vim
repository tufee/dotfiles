call plug#begin()
" Explorar de arquivos
Plug 'kyazdani42/nvim-tree.lua'

" Adiciona comentários no código
Plug 'tpope/vim-commentary'

" Adiciona tabs 
Plug 'akinsho/bufferline.nvim'

" Suporte para Git no Vim
Plug 'tpope/vim-fugitive'

" Fazer fechamento automático de pares (parênteses, colchetes, aspas, etc)
Plug 'jiangmiao/auto-pairs'

" Facilitar manipulação de 'surroundings' (pares)
Plug 'tpope/vim-surround'

" Temas
Plug 'sfi0zy/atlantic-dark.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'joshdick/onedark.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'franbach/miramare'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'sainnhe/everforest'
Plug 'bluz71/vim-moonfly-colors'
Plug 'joshdick/onedark.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Suporte para Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Suporte para smooth scrolling
Plug 'yuttie/comfortable-motion.vim'

" Plug para se mover rápido
Plug 'phaazon/hop.nvim'

" Adiciona Atalhos para funções
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" Adiciona ícones ao vim
Plug 'kyazdani42/nvim-web-devicons'

" Plugin para mover os blocos mais fácil
Plug 'matze/vim-move'

" Plugins para mostrar um preview da busca de arquivos
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plugin para realizar buscas dentro dos arquivos
Plug 'eugen0329/vim-esearch'

" Plugin de suporte para a sintaxe do .edge
Plug 'watzon/vim-edge-template'

" Plugin para criar uma GUI para o git
Plug 'TimUntersberger/neogit'

" Plugin para melhorar a movimentação
Plug 'chaoren/vim-wordmotion'

" Plugins para configuração de LSP
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'williamboman/nvim-lsp-installer'

" LSPs
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
call plug#end()

lua require('settings')
lua require('keymaps')
lua require('cmp-config')
lua require('lsp-config')
lua require('themes')
lua require("bufferline").setup()
lua require('hop').setup()
lua require('nvim-tree').setup() 
