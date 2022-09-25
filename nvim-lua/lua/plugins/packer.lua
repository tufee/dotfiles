local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

   use 'wbthomason/packer.nvim' -- Necessário para auto gestão dos pacotes
   use 'sheerun/vim-polyglot' -- Adiciona suporte para syntax highlight
   use 'dyng/ctrlsf.vim' -- Adiciona busca dentro de arquivos
   use 'kyazdani42/nvim-tree.lua' -- Explorar de arquivos                                                        
   use 'tpope/vim-commentary' -- Adiciona comentários no código                                           
   use 'akinsho/bufferline.nvim' -- Adiciona tabs                                                            
   use {'akinsho/toggleterm.nvim'} -- Abre um terminal flutuante
   use 'puremourning/vimspector' -- Debugger
   use 'tpope/vim-fugitive' -- Suporte para Git no Vim                                                  
   use 'jiangmiao/auto-pairs' -- Fazer fechamento automático de pares
   use 'tpope/vim-surround' -- Facilitar manipulação de 'surroundings' (pares)                          
   use 'farmergreg/vim-lastplace' -- Retorna a última posição que estava no arquivo
   use 'wakatime/vim-wakatime' -- Cria métricas de tempo de programação

   -- Temas                                                                    
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
                                                                              
   -- Airline                                                                  
   use 'vim-airline/vim-airline'                                             
   use 'vim-airline/vim-airline-themes'                                      
                                                                              
   use {'styled-components/vim-styled-components',  branch = 'main' } -- Suporte para Styled Components                                           
   use 'yuttie/comfortable-motion.vim' -- Suporte para smooth scrolling                                            
   use 'kyazdani42/nvim-web-devicons' -- Adiciona ícones ao vim                                                   
   use 'onsails/lspkind.nvim' -- Adiciona ícones no autocomplete
   use 'matze/vim-move' -- Suporte para mover os blocos mais fácil                                   

   -- Suporte para mostrar um preview da busca de arquivos                     
   use 'nvim-lua/plenary.nvim'                                               
   use 'nvim-telescope/telescope.nvim'                                       
   use 'nvim-treesitter/nvim-treesitter'
                                                                              
   use {'prettier/vim-prettier',  run = 'npm ci'} -- Formatter
   use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'} -- Autocomplete

   -- Suportes para configuração de LSP                                         
   use 'neovim/nvim-lspconfig'                                               
   use 'jose-elias-alvarez/nvim-lsp-ts-utils'                                
   use 'williamboman/nvim-lsp-installer'                                     
         
   -- LSPs                                                                     
   use 'hrsh7th/cmp-nvim-lsp'                                                
   use 'hrsh7th/cmp-buffer'                                                  
   use 'hrsh7th/cmp-path'                                                    
   use 'hrsh7th/cmp-cmdline'                                                 
   use 'hrsh7th/nvim-cmp'      
   use 'hrsh7th/cmp-nvim-lua'      
   use 'hrsh7th/cmp-nvim-lsp-signature-help'      
   use 'ray-x/cmp-treesitter'      

   use 'feline-nvim/feline.nvim' -- Add ícones na barra de status

  if packer_bootstrap then
    require('packer').sync()
  end
end)
