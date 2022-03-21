return require('packer').startup(function()
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
                                                                              
   -- use para se mover rápido                                                
   use 'phaazon/hop.nvim'                                                    
                                                                              
   -- Adiciona Atalhos para funções                                            
   use 'SirVer/ultisnips'                                                    
   use 'mlaursen/vim-react-snippets'                                         
                                                                              
   -- Adiciona ícones ao vim                                                   
   use 'kyazdani42/nvim-web-devicons'                                        
                                                                              
   -- usein para mover os blocos mais fácil                                   
   use 'matze/vim-move'                                                      
                                                                              
   -- useins para mostrar um preview da busca de arquivos                     
   use 'nvim-lua/plenary.nvim'                                               
   use 'nvim-telescope/telescope.nvim'                                       
   use 'nvim-treesitter/nvim-treesitter'
                                                                              
   -- usein para realizar buscas dentro dos arquivos                          
   use 'eugen0329/vim-esearch'                                               
                                                                              
   -- usein de suporte para a sintaxe do .edge                                
   use 'watzon/vim-edge-template'                                            
                                                                              
   -- usein para criar uma GUI para o git                                     
    use 'TimUntersberger/neogit'                                                
                                                                              
   -- usein para melhorar a movimentação                                      
   use 'chaoren/vim-wordmotion'                                              
                                                                              
   -- useins para configuração de LSP                                         
   use 'neovim/nvim-lspconfig'                                               
   use 'jose-elias-alvarez/null-ls.nvim'                                     
   use 'jose-elias-alvarez/nvim-lsp-ts-utils'                                
   use 'williamboman/nvim-lsp-installer'                                     
                                                                              
   -- LSPs                                                                     
   use 'hrsh7th/cmp-nvim-lsp'                                                
   use 'hrsh7th/cmp-buffer'                                                  
   use 'hrsh7th/cmp-path'                                                    
   use 'hrsh7th/cmp-cmdline'                                                 
   use 'hrsh7th/nvim-cmp'                                                    
                                                                              
   -- Snippets                                                                 
   use 'dcampos/nvim-snippy'                                                 
   use 'dcampos/cmp-snippy'                                                  
end) 
