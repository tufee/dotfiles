local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

set('n', '<Leader><CR>', ':noh<CR>', ns) -- Remover highlight da busca com <leader><space>
set('n', '<Leader>ev', ':e ~/.config/nvim<CR>', ns) -- Atalho para edição do arquivo de configuração
set('n', '<Leader>sv', ':luafile %<CR>', ns) -- Atalho para atualizar as configurações
set('n', '<C-A>', 'ggVG<CR>', ns) -- Atalho para selecionar tudo
set("n", "<C-W>", ":bd<CR>", ns) -- Atalho para fechar o buffer atual
set("x", "<Leader>p", "\"_dP", ns) -- Atalho para manter o registro quando substituir algo que foi copiado
set("n", "<Leader>v", "<C-W>v", ns) -- Atalho para split da tela na horizontal
set('n', '<Leader>s', '<C-W>s', ns) -- Atalho para split da tela na vertical
set('n', '<Leader>c', '<C-W>c', ns) -- Fecha a tela atual sem fechar o buffer
set('n', '<Leader>o', '<C-W>o', ns) -- Fecha todas as telas menos o buffer atual
set('n', '<Tab>', ':bn<CR>', ns) -- Se move para o próximo buffer
set('n', '<S-Tab>', ':bp<CR>', ns) -- Se move para o buffer anterior
set('i', 'kj', '<ESC>', ns) -- Entra no modo normal
set('n', '<C-S>', ':w!<CR>', ns) -- Salvar usando CTRL + S
set('n', '<C-Q>', ':q!<CR>', ns) -- Sair usando CTRL + q
set('n', '<C-N>', ':NvimTreeToggle<CR>', ns) -- Abre o explorador de arquivos
set('n', '<Leader>r', ':NvimTreeRefresh<CR>', ns) -- Atualiza o explorador de arquivos
set('n', '<C-p>', ':Telescope find_files<CR>', ns) -- Realiza busca por arquivos do projeto
set('n', '<C-F>f', ':CtrlSF ', ns) -- Realiza busca por palavra dentro dos arquivos
set('v', '<C-F>f', '<Plug>CtrlSFVwordExec', ns) -- Realiza busca por palavra dentro dos arquivos usando a palavra selecionado no modo visual
set('n', '<C-F>t', ':CtrlSFsToggle<CR>', ns) -- Ative e desativa o menu de busca
set('n', '<C-O>', ':Telescope buffers<CR>', ns) -- Mostra os buffers abertos 
vim.cmd('map <Leader>lf :lua vim.lsp.buf.formatting_sync(nil, 10000)<CR>') -- Formatter

-- Atalho para ajustar identação
set("v", "<", "<gv", ns)
set("v", ">", ">gv", ns)  

-- Atalho para se mover entre os buffers abertos na mesma janela
set('n', '<C-J>', '<C-W><C-J>', ns)
set('n', '<C-K>', '<C-W><C-K>', ns)
set('n', '<C-L>', '<C-W><C-L>', ns)
set('n', '<C-H>', '<C-W><C-H>', ns)

-- Atalho para mudar o tamanho da janela
set("n", "<C-Up>", ":resize -2<CR>", ns)
set("n", "<C-Down>", ":resize +2<CR>", ns)
set("n", "<C-Left>", ":vertical resize +2<CR>", ns)
set("n", "<C-Right>", ":vertical resize -2<CR>", ns)  

-- Atalho para ir para o final da linha
set("n", "<Leader>l", "<S-$>", ns)
set("v", "<Leader>l", "<S-$>", ns)

-- Atalho para ir para o inicio da linha
set("n", "<Leader>h", "<S-_>", ns)
set("v", "<Leader>h", "<S-_>", ns)

-- Permite que o cursor acompanhe a rolagem da tela
vim.g.comfortable_motion_scroll_down_key = "j"
vim.g.comfortable_motion_scroll_up_key = "k" 

-- Atalho para comentários
set("n", "<Leader>/", ":Commentary<CR>", ns)
set("v", "<Leader>/", ":Commentary<CR>", ns)

-- Atalhos vimspector debugger
set("n", "<leader>dl", ":call vimspector#Launch()<cr>",
  {silent = true, noremap = true}
  ) 

set("n", "<leader>dr", "<Plug>VimspectorRestart<cr>",
  {silent = true, noremap = true}
  )

set("n", "<leader>dR", ":call vimspector#Reset()<cr>",
  {silent = true, noremap = true}
  )

set("n", "<leader>dc", ":call vimspector#Continue()<cr>",
  {silent = true, noremap = true}
  ) 

set("n", "<leader>dt", ":call vimspector#ToggleBreakpoint()<cr>",
  {silent = true, noremap = true}
  ) 

set("n", "<leader>dT", ":call vimspector#ClearBreakpoints()<cr>",
  {silent = true, noremap = true}
  )

set("n", "<leader>db", "<Plug>VimspectorBreakpoints<cr>",
  {silent = true, noremap = true}
  )

set("n", "<leader>dw", "<Plug>VimspectorBalloonEval<cr>",
  {silent = true, noremap = true}
  )

set("n", "<leader>do", "<Plug>VimspectorStepOver<cr>",
  {silent = true, noremap = true} 
  )

set("n", "<leader>di", "<Plug>VimspectorStepInto",
  {silent = true, noremap = true} 
  )
