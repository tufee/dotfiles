local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }
 
-- Remover highlight da busca com <leader><space>
set('n', '<Leader><CR>', ':noh<CR>', ns)

-- Atalho para edição do arquivo de configuração
set('n', '<Leader>ev', ':e ~/.config/nvim/lua/', ns)
                  
-- Atalho para atualizar as configurações
set('n', '<Leader>sv', ':luafile %<CR>', ns)

-- Atalho para se mover entre os buffers abertos na mesma janela
set('n', '<C-J>', '<C-W><C-J>', ns)
set('n', '<C-K>', '<C-W><C-K>', ns)
set('n', '<C-L>', '<C-W><C-L>', ns)
set('n', '<C-H>', '<C-W><C-H>', ns)

-- Atalho para split da tela
set("n", "<Leader>h", ":<C-u>split<CR>", ns)
set("n", "<Leader>v", ":<C-u>vsplit<CR>", ns)

-- Abre uma nova janela vazia
set('n', '<C-T>', ':tabnew<CR>', ns)

-- Se move para o próximo buffer
set('n', '<Tab>', ':bn<CR>', ns)

-- Se move para o buffer anterior
set('n', '<S-Tab>', ':bp<CR>', ns)

-- Entra no modo visual
set('i', 'kj', '<ESC>', ns)

-- Salvar usando CTRL + S
set('n', '<C-S>', ':w!<CR>', ns)

-- Sair usando CTRL + q
set('n', '<C-Q>', ':q!<CR>', ns)

-- Fecha o buffer atual
set('n', '<C-K>', ':bd<CR>', ns)

set('n', '<C-N>', ':NvimTreeToggle<CR>', ns)
set('n', '<Leader>r', ':NvimTreeRefresh<CR>', ns)

set('n', '<C-p>', ':Telescope find_files<CR>', ns)
set('n', '<Leader>ff', ':Telescope live_grep<CR>', ns)
set('n', '<C-O>', ':Telescope buffers<CR>', ns)
