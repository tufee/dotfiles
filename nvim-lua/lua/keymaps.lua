local set = vim.keymap.set

set("n", "<C-N>", ":Neotree toggle<CR>")

-- set("n", "<C-N>", ":Lex<CR>")
set("n", "<Tab>", "*")

set("n", "<Leader>a", "ggVG<CR>")
set("n", "<Leader>w", ":w<CR>")
set("n", "<Leader>q", ":q!<CR>")
set("n", "<Leader><CR>", ":noh<CR>")

set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set("n", "<C-Down>", ":resize +2<CR>")
set("n", "<C-Left>", ":vertical resize -2<CR>")
set("n", "<C-Right>", ":vertical resize +2<CR>")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "<C-D>", "<C-D>zz")
set("n", "<C-U>", "<C-U>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-K>", ":bn<CR>")
set("n", "<C-J>", ":bp<CR>")

set("n", "<Leader><Leader>", ":Telescope buffers<CR>")
set("n", "<C-F>", ":Telescope live_grep<CR>")
set("n", "<C-p>",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set('n', '<leader>ef', ':EslintFixAll<CR>')

set('n', '<leader>tn', ':lua require("neotest").run.run()<CR>')
set('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
set('n', '<leader>td', ':lua require("neotest").run.run({strategy = "dap"})<CR>')

set("n", "<F1>", "<Cmd>lua require'dapui'.eval()<CR>")
set("n", "<F2>", "<Cmd>lua require'dap'.clear_breakpoints()<CR>")
set("n", "<F3>", "<Cmd>lua require'dap'.disconnect({require'dapui'.close()})<CR>")
set("n", "<F4>", "<Cmd>lua require'dap'.run_last()<CR>")
set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
set("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
set("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
set("n", "<leader>dT", "<Cmd>lua require'dap'.clear_breakpoints()<CR>")
set("n", "<leader>dw", "<Cmd>lua require'dapui'.eval()<CR>")
