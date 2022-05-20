local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

-- Remover highlight da busca com <leader><space>
set('n', '<Leader><CR>', ':noh<CR>', ns)

-- Atalho para edição do arquivo de configuração
set('n', '<Leader>ev', ':e ~/.config/nvim<CR>', ns)

-- Atalho para atualizar as configurações
set('n', '<Leader>sv', ':source ~/.config/nvim/init.lua<CR>', ns)

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

set('n', '<C-B>', ':Telescope projects<CR>', ns)

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

-- Abre o explorador de arquivos
set('n', '<C-N>', ':NvimTreeToggle<CR>', ns)

-- Atualiza o explorador de arquivos
set('n', '<Leader>r', ':NvimTreeRefresh<CR>', ns)

-- Realiza busca por arquivos do projeto
set('n', '<C-p>', ':Telescope find_files<CR>', ns)

-- Realiza busca dentro dos arquivos do projeto
set('n', '<Leader>ff', ':Telescope live_grep<CR>', ns)

-- Mostra os buffers abertos
set('n', '<C-O>', ':Telescope buffers<CR>', ns)

-- Atalhos floaterm
vim.g.floaterm_keymap_new = "<F7>" 
vim.g.floaterm_keymap_prev = "<F8>" 
vim.g.floaterm_keymap_toggle = "<F9>" 

-- Mostra as opções para se mover no código
vim.api.nvim_set_keymap('n', '<S-s>', '<CMD>HopWord<CR>', ns)

-- Permite que o cursor acompanhe a rolagem da tela
vim.g.comfortable_motion_scroll_down_key = "j"
vim.g.comfortable_motion_scroll_up_key = "k" 

-- Atalho para comentários
set("n", "<Leader>/", ":Commentary<CR>", ns)
set("v", "<Leader>/", ":Commentary<CR>", ns)

-- Atalhos para diagnósticos de erro
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
) 

-- Usa o enter para aceitar o autoplmente
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', 
  {expr = true}
)

-- Formatter
vim.cmd [[autocmd BufWritePre * undojoin | Neoformat]]

-- Atalhos vimspector debugger
vim.api.nvim_set_keymap("n", "<leader>dl", ":call vimspector#Launch()<cr>",
  {silent = true, noremap = true}
) 

vim.api.nvim_set_keymap("n", "<leader>dr", "<Plug>VimspectorRestart<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>dR", ":call vimspector#Reset()<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>dc", ":call vimspector#Continue()<cr>",
  {silent = true, noremap = true}
) 

vim.api.nvim_set_keymap("n", "<leader>dt", ":call vimspector#ToggleBreakpoint()<cr>",
  {silent = true, noremap = true}
) 

vim.api.nvim_set_keymap("n", "<leader>dT", ":call vimspector#ClearBreakpoints()<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>db", "<Plug>VimspectorBreakpoints<cr>",
  {silent = true, noremap = true}
)

 vim.api.nvim_set_keymap("n", "<leader>dw", "<Plug>VimspectorBalloonEval<cr>",
  {silent = true, noremap = true}
) 
