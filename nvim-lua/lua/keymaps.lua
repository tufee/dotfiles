local set = vim.keymap.set

set("i", "kj", "<ESC>", { silent = true })
set("n", "<C-N>", ":e .<CR>", { silent = true })
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
set("n", "<C-O>", ":Telescope buffers<CR>", { silent = true })
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

-- set("n", "<S-Y>", "<Cmd>lua require'dap'.step_into()<CR>", { silent = true })
-- set("n", "<S-L>", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true })
-- set("n", "<S-H>", function() require("dap").continue() end)
-- set("n", "<leader>d_", "<Cmd>lua require'dap'.run_last()<CR>", { silent = true })
-- set("n", "<leader>dh", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
-- set("n", "<leader>dH", "<Cmd>lua require'dap'.clear_breakpoints()<CR>", { silent = true })
-- set("n", "<leader>di", function() require("dap.ui.widgets").hover() end)
-- set("n", "<leader>d?", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end)
-- set("n", "<leader>dq", function() require("dap").terminate() end)
-- set("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
-- set("n", "<leader>da", "<Cmd>lua require'plugins.dap'.attach()<CR>")

-- Atalhos vimspector debugger
vim.api.nvim_set_keymap("n", "<leader>dl", ":call vimspector#Launch()<cr>",
  {silent = true, noremap = true}
) 

vim.api.nvim_set_keymap("n", "<leader>dr", "<Plug>VimspectorRestart<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>dq", ":call vimspector#Reset()<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<S-H>", ":call vimspector#Continue()<cr>",
  {silent = true, noremap = true}
) 

vim.api.nvim_set_keymap("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<cr>",
  {silent = true, noremap = true}
) 

vim.api.nvim_set_keymap("n", "<leader>dH", ":call vimspector#ClearBreakpoints()<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<leader>db", "<Plug>VimspectorBreakpoints<cr>",
  {silent = true, noremap = true}
)

 vim.api.nvim_set_keymap("n", "<leader>dw", "<Plug>VimspectorBalloonEval<cr>",
  {silent = true, noremap = true}
) 
