local set = vim.keymap.set

-- vim.g.comfortable_motion_scroll_down_key = "j"
-- vim.g.comfortable_motion_scroll_up_key = "k"

set("n", "<Leader><CR>", ":noh<CR>", { silent = true, desc = "Remove highlight in the search" })
set("n", "<Leader>ev", ":e ~/.config/nvim<CR>", { silent = true, desc = "edit config file" })
set("n", "<Leader>sv", ":source $MYVIMRC<CR>", { silent = true, desc = "reload all files configs" })
set("n", "<Leader>rl", ":luafile %<CR>", { silent = true, desc = "reload file config" })

set("n", "<C-S>", ":w<CR>", { silent = true, desc = "save file" })
set("n", "<C-G>", ":bd<CR>", { silent = true, desc = "close buffer" })
set("n", "<C-Q>", ":q!<CR>", { silent = true, desc = "close window" })

set("n", "<Leader>a", "ggVG<CR>", { silent = true, desc = "select all" })
set("x", "<Leader>p", '"_dP', { silent = true, desc = "stay the register when copy" })

set("n", "<Tab>", ":bn<CR>", { silent = true, desc = "move to next buffer" })
set("n", "<S-Tab>", ":bp<CR>", { silent = true, desc = "move to previous buffer" })
set("n", "<C-O>", ":Telescope buffers<CR>", { silent = true, desc = "show opened buffer" })

set("i", "kj", "<ESC>", { silent = true, desc = "enter in normal mode" })

set("n", "<C-N>", ":NvimTreeToggle<CR>", { silent = true, desc = "open file explorer" })
set("n", "<Leader>r", ":NvimTreeRefresh<CR>", { silent = true, desc = "reload file explorer" })

set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true, desc = "find files" })
set("n", "<C-F>f", ":CtrlSF ", { silent = true, desc = "search word" })
set("v", "<C-F>f", "<Plug>CtrlSFVwordExec", { silent = true, desc = "search selected word" })
set("n", "<C-F>t", ":CtrlSFToggle<CR>", { silent = true, desc = "toggle find menu" })

set("v", "<", "<gv", { silent = true, desc = "adjust indentation" })
set("v", ">", ">gv", { silent = true, desc = "adjust indentation" })

set("n", "<C-J>", "<C-W><C-J>", { silent = true, desc = "move to below buffer" })
set("n", "<C-K>", "<C-W><C-K>", { silent = true, desc = "move to top buffer" })
set("n", "<C-L>", "<C-W><C-L>", { silent = true, desc = "move to left buffer" })
set("n", "<C-H>", "<C-W><C-H>", { silent = true, desc = "move to right buffer" })

set("n", "<C-Down>", ":resize +2<CR>", { silent = true, desc = "resize screen" })
set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, desc = "resize screen" })
set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, desc = "resize screen" })

set("n", "<Leader>l", "$", { silent = true, desc = "go to end of line" })
set("v", "<Leader>l", "$", { silent = true, desc = "go to end of line" })
set("n", "<Leader>h", "_", { silent = true, desc = "go to start of line" })
set("v", "<Leader>h", "_", { silent = true, desc = "go to start of line" })

set("n", "<Leader>/", ":Commentary<CR>", { silent = true, desc = "set commentary" })
set("v", "<Leader>/", ":Commentary<CR>", { silent = true, desc = "set commentary" })

set("n", "<S-j>", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true, desc = "step over" })
set("n", "<S-l>", "<Cmd>lua require'dap'.step_into()<CR>", { silent = true, desc = "step into" })
set("n", "<S-k>", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true, desc = "step into" })
set("n", "<S-h>", function()
  require("dap").continue()
end)
set("n", "<leader>d_", "<Cmd>lua require'dap'.run_last()<CR>", { silent = true, desc = "restart debbuger" })
set("n", "<leader>dh", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, desc = "toggle break point" })
set(
  "n",
  "<leader>dH",
  "<Cmd>lua require'dap'.clear_breakpoints()<CR>",
  { silent = true, desc = "clear all break points" }
)
set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
set("n", "<leader>dq", function()
  require("dap").terminate()
end)
set("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
set("n", "<leader>da", "<Cmd>lua require'plugins.dap'.attach()<CR>")
