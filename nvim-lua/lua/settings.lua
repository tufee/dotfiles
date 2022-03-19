local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- Ativa o suporte para 256 cores
opt.termguicolors = true

-- Define tabs como espaços
opt.expandtab = true

-- Número de espaços visuais ao pressionar a tecla TAB
opt.tabstop = 2

-- Número de espaços contados em uma tabulação quando estiver editando
opt.softtabstop = 2

-- Número de espaços contados em uma tabulação em nova linha
opt.shiftwidth = 2

-- Remove a marca da linha atual
opt.cursorline = false

-- Mostra os números das linhas
opt.number = true

-- Mostra o números das linhas em relação a posição do cursor
opt.relativenumber = true

-- Ativa o mouse
opt.mouse = 'a'

-- Permite editar outros arquivos sem salvar um antes de abrir outro
opt.hidden = true

-- Permite ter uma pré-visualização antes de fazer uma substituição com :%s
opt.inccommand = 'split'

-- Permite copiar do clipboard para o vim e do vim para o clipboard
opt.clipboard = 'unnamedplus'

-- Destaca os resultados da busca
opt.hlsearch = true

-- Ignora letras maiúsculas e minúsculas na busca
opt.ignorecase = true

-- Sobrescreve o `ignorecase` quando houver caracteres em maísuculo na busca
opt.smartcase = true

-- Adiciona quebra de linhas quando elas ficam grandes
opt.lbr = true

-- Define a tecla `leader` como a espaço
g.mapleader = ' '

  
-- Mostra as opções para se mover no código
-- nmap <S-s> <Cmd>HopWord<CR>

-- " Atalho para o floaterm
-- let g:floaterm_keymap_new    = '<F7>'
-- let g:floaterm_keymap_toggle = '<F8>'




-- Atalho para ultisnips
-- let g:UltiSnipsExpandTrigger='<c-j>'




-- Define o atalho Ctrl + P para utilizar o fzf
-- nnoremap <c-p> :Telescope find_files<cr>

-- Atalhos para o explorador de arquivos
-- nnoremap <C-n> :NvimTreeToggle<CR>
-- nnoremap <leader>r :NvimTreeRefresh<CR>

-- Permiter usar o `enter` para
-- realizar a confirmação do autocomplete
-- inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
-- \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

-- Atalho para ir para as definições da função
-- nmap <silent> gd <Plug>(coc-definition)



-- Permite que o cursor acompanhe a rolagem da tela
-- let g:comfortable_motion_scroll_down_key = "j"
-- let g:comfortable_motion_scroll_up_key = "k"

-- Permitir fontes Powerline
-- let g:airline_powerline_fonts=1

-- " Retorna na última posição quando o arquivo é aberto
-- autocmd BufReadPost *
-- \ if line("'\"") > 0 && line("'\"") <= line("$") |
-- \   exe "normal! g`\"" |
-- \ endif




-- Inicia o backup
-- set backup

-- Define o diretório para os backups
-- set backupdir=~/.config/nvim/backups

-- Arquivos do qual backups devem ser ignorados
-- set backupskip=/tmp/*

-- Salva o arquivo no backup
-- set writebackup

-- Ajuste para hot reloading (desabilitar o 'safe write')
-- set backupcopy=yes

-- Impede do cursor voltar para o começo da linha
-- quando há espaços em branco
opt.virtualedit = 'all'







