local set = vim.keymap.set

set("i", "kj", "<ESC>", { silent = true })
set("n", "<C-N>", ":NeoTreeShow<CR>", { silent = true })
set("n", "<Leader><CR>", ":noh<CR>", { silent = true })
set("n", "<Leader>ev", ":e ~/.config/nvim<CR>", { silent = true })
set("n", "<Leader>sv", ":source $MYVIMRC<CR>", { silent = true })
set("n", "<Leader>rl", ":luafile %<CR>", { silent = true })
set("n", "<C-C>", ":%y+<CR>", { silent = true })
set("n", "<Leader>a", "ggVG<CR>", { silent = true })

set("n", "<Leader>w", ":w<CR>", { silent = true })
set("n", "<Leader>g", ":bd<CR>", { silent = true })
set("n", "<Leader>o", ":w | %bd | e#<CR>", { silent = true })
set("n", "<Leader>q", ":qa | %bd | e#<CR>", { silent = true })
set("n", "<C-q>", ":q!<CR>", { silent = true })
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set("n", "<C-H>", "<C-W>h", { silent = true })
-- set("n", "<C-J>", "<C-W>j", { silent = true })
-- set("n", "<C-K>", "<C-W>k", { silent = true })
-- set("n", "<C-L>", "<C-W>l", { silent = true })

set("n", "<C-D>", "<C-D>zz", { silent = true })
set("n", "<C-U>", "<C-U>zz", { silent = true })

set("n", "n", "nzzzv", { silent = true })
set("n", "N", "Nzzzv", { silent = true })

set("n", "<C-K>", ":bn<CR>", { silent = true })
set("n", "<C-J>", ":bp<CR>", { silent = true })

set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true })
set("n", "<Leader><Leader>", ":Telescope buffers<CR>", { silent = true })
set("n", "<C-F>", ":Telescope live_grep<CR>", { silent = true })

set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

set("v", "<", "<gv", { silent = true })
set("v", ">", ">gv", { silent = true })

set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

set("n", "<C-E>", "$", { silent = true })
set("v", "<C-E>", "$", { silent = true })
set("n", "<C-B>", "_", { silent = true })
set("v", "<C-B>", "_", { silent = true })

set("n", "<C-p>",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { silent = true, noremap = true })

set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>')
set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>')
set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')

set('n', '<leader>ef', ':EslintFixAll<CR>')

set('n', '<leader>tn', ':lua require("neotest").run.run()<CR>')
set('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
set('n', '<leader>td', ':lua require("neotest").run.run({strategy = "dap"})<CR>')

set("n", "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>", { silent = true, desc = 'launch debbuger' })
set("n", "<leader>dt", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, desc = 'toggle break point' })
set("n", "<leader>dT", "<Cmd>lua require'dap'.clear_breakpoints()<CR>", { silent = true, desc = 'clear all break points' })
set("n", "<leader>dr", "<Cmd>lua require'dap'.run_last()<CR>", { silent = true, desc = 'restart debbuger' })
set("n", "<leader>do", "<Cmd>lua require'dap'.step_over()<CR>", { silent = true, desc = 'step over' })
set("n", "<leader>di", "<Cmd>lua require'dap'.step_into()<CR>", { silent = true, desc = 'step into' })
set("n", "<leader>dq", "<Cmd>lua require'dap'.disconnect({require'dapui'.close()})<CR>", { silent = true, desc = 'reset debbuger' })
set("n", "<leader>dw", "<Cmd>lua require'dapui'.eval()<CR>", { silent = true, desc = 'eval variable' })
