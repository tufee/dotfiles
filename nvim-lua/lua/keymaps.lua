local set = vim.keymap.set

set("i", "kj", "<ESC>", { silent = true })
set("n", "<C-N>", ":NvimTreeToggle<CR>", { silent = true })
set("n", "<Leader><CR>", ":noh<CR>", { silent = true })
set("n", "<Leader>ev", ":e ~/.config/nvim<CR>", { silent = true })
set("n", "<Leader>sv", ":source $MYVIMRC<CR>", { silent = true })
set("n", "<Leader>rl", ":luafile %<CR>", { silent = true })

set("n", "<C-S>", ":w<CR>", { silent = true })
set("n", "<C-G>", ":bd<CR>", { silent = true })
set("n", "<C-Q>", ":q!<CR>", { silent = true })

set("n", "<Leader>a", "ggVG<CR>", { silent = true })
set("x", "<Leader>p", '"_dP', { silent = true })

set("n", "<Tab>", ":bn<CR>", { silent = true })
set("n", "<S-Tab>", ":bp<CR>", { silent = true })

set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })
set("n", "<Leader><Leader>", ":Telescope buffers<CR>", { silent = true })
set("n", "<C-F>", ":Telescope live_grep<CR>", { silent = true })

set("v", "<", "<gv", { silent = true })
set("v", ">", ">gv", { silent = true })

set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

set("n", "<Leader>l", "$", { silent = true })
set("v", "<Leader>l", "$", { silent = true })
set("n", "<Leader>h", "_", { silent = true })
set("v", "<Leader>h", "_", { silent = true })

set("n", "<Leader>/", ":Commentary<CR>", { silent = true })
set("v", "<Leader>/", ":Commentary<CR>", { silent = true })

-- Atalhos vimspector debugger
vim.api.nvim_set_keymap("n", "<leader>dl", ":call vimspector#Launch()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", "<Plug>VimspectorRestart<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dq", ":call vimspector#Reset()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-H>", ":call vimspector#Continue()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-L>", ":call vimspector#StepOver()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<S-F>", ":call vimspector#StepInto()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dH", ":call vimspector#ClearBreakpoints()<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", "<Plug>VimspectorBreakpoints<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dw", "<Plug>VimspectorBalloonEval<cr>", { silent = true, noremap = true })
