local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local path = vim.fn.expand('~/.config')

-- Define a tecla `leader` como a espaço
g.mapleader = ' ' 

-- Ativa o suporte para 256 cores
opt.termguicolors = true

-- Adiciona coluna quando o conteúdo fica muito grande
opt.signcolumn = 'yes'

-- Define tabs como espaços
opt.expandtab = true

-- Número de espaços visuais ao pressionar a tecla TAB
opt.tabstop = 2

opt.colorcolumn = '100'

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

opt.swapfile = false

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

-- Ativa o backup
opt.backup = true

-- Salva automaticamente um histórico de ações para `desfazer` 
opt.undofile = true

-- Salva o arquivo no backup
opt.writebackup = true

-- Define diretório para salvar histórico de `desfazer`
opt.undodir = { path .. '/nvim/undos'}

-- Define o diretório para os backups
opt.backupdir = {path .. '/nvim/backups'}

-- Melhora o autocomplete
opt.completeopt= 'menuone,noinsert,noselect'

-- Não volta para o inicio da linha ao se movimentar
opt.virtualedit = 'all'

-- ulstisnips spend time finding python provider
-- https://github.com/neovim/neovim/issues/5702#issuecomment-264440944
vim.g.loaded_python_provider = 1
vim.g.python_host_skip_check=1
vim.g.python_host_prog = '/bin/python2'
vim.g.python3_host_skip_check=1
vim.g.python3_host_prog = '/bin/python3'
