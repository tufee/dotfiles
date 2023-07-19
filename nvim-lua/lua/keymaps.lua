local set = vim.keymap.set

set("n", "<C-N>", ":NeoTreeShow<CR>")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "<C-D>", "<C-D>zz")
set("n", "<C-U>", "<C-U>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-K>", ":bn<CR>")
set("n", "<C-J>", ":bp<CR>")

set("n", "<Leader><Leader>", ":Telescope buffers<CR>")
set("n", "<C-F>", ":Telescope live_grep<CR>")
set("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>')
set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>')
set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>')
set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')

set('n', '<leader>ef', ':EslintFixAll<CR>')

set('n', '<leader>tn', ':lua require("neotest").run.run()<CR>')
set('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
set('n', '<leader>td', ':lua require("neotest").run.run({strategy = "dap"})<CR>')

set("n", "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>")
set("n", "<leader>dt", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
set("n", "<leader>dT", "<Cmd>lua require'dap'.clear_breakpoints()<CR>")
set("n", "<leader>dr", "<Cmd>lua require'dap'.run_last()<CR>")
set("n", "<leader>do", "<Cmd>lua require'dap'.step_over()<CR>")
set("n", "<leader>di", "<Cmd>lua require'dap'.step_into()<CR>")
set("n", "<leader>dq", "<Cmd>lua require'dap'.disconnect({require'dapui'.close()})<CR>")
set("n", "<leader>dw", "<Cmd>lua require'dapui'.eval()<CR>")
