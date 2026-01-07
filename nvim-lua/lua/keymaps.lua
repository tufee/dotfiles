local set = vim.keymap.set

set("n", "<C-N>", ":Neotree toggle<CR>")

set("n", "<Leader>a", "ggVG<CR>")
set("n", "<Leader>w", ":w<CR>")
set("n", "<Leader>q", ":q!<CR>")
set("n", "<C-l>", ":bd<CR>")
set("n", "<Leader><CR>", ":noh<CR>")

set("n", "<C-Down>", ":resize +2<CR>")
set("n", "<C-Left>", ":vertical resize -2<CR>")
set("n", "<C-Right>", ":vertical resize +2<CR>")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "<C-D>", "<C-D>zz")
set("n", "<C-U>", "<C-U>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<TAB>", ":bn<CR>")
set("n", "<S-TAB>", ":bp<CR>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set('n', '<leader>ef', ':EslintFixAll<CR>')
