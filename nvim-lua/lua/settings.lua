local g = vim.g
local set = vim.opt
local path = vim.fn.expand('~/.config')

g.mapleader = ' ' -- Define a tecla `leader` como a espaço
g.ctrlsf_winsize = '30%'
set.list = true
set.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
set.termguicolors = true -- Ativa o suporte para 256 cores
set.signcolumn = 'yes' -- Adiciona coluna quando o conteúdo fica muito grande
opt.expandtab = true
set.tabstop = 2 -- Número de espaços visuais ao pressionar a tecla TAB
set.softtabstop = 2 -- Número de espaços contados em uma tabulação quando estiver editando
set.shiftwidth = 2 -- Número de espaços contados em uma tabulação em nova linha
set.cursorline = true -- Remove a marca da linha atual
set.number = true -- Mostra os números das linhas
set.relativenumber = true -- Mostra o números das linhas em relação a posição do cursor
set.mouse = 'a' -- Ativa o mouse
set.swapfile = false -- Desativa o swap 
set.vim.opt.autoindent = true
set.hidden = true -- Permite editar outros arquivos sem salvar um antes de abrir outro
set.inccommand = 'split' -- Permite ter uma pré-visualização antes de fazer uma substituição com :%s
set.clipboard = 'unnamedplus' -- Permite copiar do clipboard para o vim e do vim para o clipboard
set.hlsearch = true -- Destaca os resultados da busca
set.ignorecase = true -- Ignora letras maiúsculas e minúsculas na busca
set.smartcase = true -- Sobrescreve o `ignorecase` quando houver caracteres em maísuculo na busca
set.lbr = true -- Adiciona quebra de linhas quando elas ficam grandes
set.backup = true -- Ativa o backup
set.undofile = true -- Salva automaticamente um histórico de ações para `desfazer` 
set.writebackup = true -- Salva o arquivo no backup
set.undodir = { path .. '/nvim/undos'} -- Define diretório para salvar histórico de `desfazer`
set.backupdir = {path .. '/nvim/backups'} -- Define o diretório para os backups
set.completeopt = { 'menuone', 'noselect' } -- adiciona um menu de autocomplete e não seleciona o item automaticamente
set.virtualedit = 'all' --Não volta para o inicio da linha ao se movimentar
