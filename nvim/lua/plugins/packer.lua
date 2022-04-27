local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

   -- Necessário para auto gestão dos pacotes
   use 'wbthomason/packer.nvim'

   -- Explorar de arquivos                                                        
   use 'kyazdani42/nvim-tree.lua'                                            
                                                                              
   -- Adiciona comentários no código                                           
   use 'tpope/vim-commentary'                                                
                                                                              
   -- Adiciona tabs                                                            
   use 'akinsho/bufferline.nvim'                                             
                                                                              
   -- Suporte para Git no Vim                                                  
   use 'tpope/vim-fugitive'                                                  
                                                                              
   -- Fazer fechamento automático de pares (parênteses, colchetes, aspas, etc) 
   use 'jiangmiao/auto-pairs'                                                
                                                                              
   -- Facilitar manipulação de 'surroundings' (pares)                          
   use 'tpope/vim-surround'                                                  

   -- Retorna a última posição que estava no arquivo
   use 'farmergreg/vim-lastplace'
                                                                              
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
                                                                              
   -- Suporte para Styled Components                                           
   use {'styled-components/vim-styled-components',  branch = 'main' }       
                                                                              
   -- Suporte para smooth scrolling                                            
   use 'yuttie/comfortable-motion.vim'                                       
                                                                              
   -- Suporte para se mover rápido                                                
   use 'phaazon/hop.nvim'                                                    
                                                                              
   -- Adiciona ícones ao vim                                                   
   use 'kyazdani42/nvim-web-devicons'                                        
                                                                              
   -- Suporte para mover os blocos mais fácil                                   
   use 'matze/vim-move'                                                      
                                                                              
   -- Suporte para mostrar um preview da busca de arquivos                     
   use 'nvim-lua/plenary.nvim'                                               
   use 'nvim-telescope/telescope.nvim'                                       
   use 'nvim-treesitter/nvim-treesitter'
                                                                              
   -- Suporte para realizar buscas dentro dos arquivos                          
   use 'eugen0329/vim-esearch'                                               
                                                                              
   -- Suporte de suporte para a sintaxe do .edge                                
   use 'watzon/vim-edge-template'                                            
                                                                              
   -- Suporte para criar uma GUI para o git                                     
   use 'TimUntersberger/neogit'                                                

   -- Suporte para git diff
   use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
                                                                              
   -- Suporte para melhorar a movimentação                                      
   use 'chaoren/vim-wordmotion'                                              
                                                                              
   -- Suportes para configuração de LSP                                         
   use 'neovim/nvim-lspconfig'                                               
   use 'jose-elias-alvarez/null-ls.nvim'                                     
   use 'jose-elias-alvarez/nvim-lsp-ts-utils'                                
   use 'williamboman/nvim-lsp-installer'                                     
                                                                              
   -- Suporte para auto complete LSP
   use { 'ms-jpq/coq_nvim', branch = 'coq' }

   -- Snippets                                                                 
   use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

   -- Mostra diagnósticos de erro
   use 'folke/trouble.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
