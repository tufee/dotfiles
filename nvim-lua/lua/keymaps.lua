local set = vim.keymap.set

set("i", "kj", "<ESC>", { silent = true })
set("n", "<C-N>", ":NeoTreeShow<CR>", { silent = true })
set("n", "<Leader><CR>", ":noh<CR>", { silent = true })
set("n", "<Leader>ev", ":e ~/.config/nvim<CR>", { silent = true })
set("n", "<Leader>sv", ":source $MYVIMRC<CR>", { silent = true })
set("n", "<Leader>rl", ":luafile %<CR>", { silent = true })
set("n", "<C-C>", ":%y+<CR>", { silent = true })
set("v", "Y", "}mgy`g", { silent = true })
set("n", "<Leader>a", "ggVG<CR>", { silent = true })
set("n", "á", "'a", { silent = true })

set("n", "<Leader>w", ":w<CR>", { silent = true })
set("n", "<Leader>g", ":bd<CR>", { silent = true })
set("n", "<Leader>o", ":w | %bd | e#<CR>", { silent = true })
set("n", "<C-q>", ":q!<CR>", { silent = true })
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "<C-H>", "<C-W>h", { silent = true })
set("n", "<C-J>", "<C-W>j", { silent = true })
set("n", "<C-K>", "<C-W>k", { silent = true })
set("n", "<C-L>", "<C-W>l", { silent = true })

set("n", "<C-D>", "<C-D>zz", { silent = true })
set("n", "<C-U>", "<C-U>zz", { silent = true })

set("n", "n", "nzzzv", { silent = true })
set("n", "N", "Nzzzv", { silent = true })

set("n", "<Tab>", ":bn<CR>", { silent = true })
set("n", "<S-Tab>", ":bp<CR>", { silent = true })

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

set("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", { silent = true, noremap = true })

set("n", "<leader>cg", ":ChatGPT<CR>")
set("n", "<leader>ce", ":ChatGPTEditWithInstructions<CR>")

-- Atalhos vimspector debugger
set("n", "<leader>dl", ":call vimspector#Launch()<cr>", { silent = true, noremap = true })
set("n", "<leader>dr", "<Plug>VimspectorRestart<cr>", { silent = true, noremap = true })
set("n", "<leader>dq", ":call vimspector#Reset()<cr>", { silent = true, noremap = true })
set("n", "<S-H>", ":call vimspector#Continue()<cr>", { silent = true, noremap = true })
set("n", "<S-L>", ":call vimspector#StepOver()<cr>", { silent = true, noremap = true })
set("n", "<S-Y>", ":call vimspector#StepInto()<cr>", { silent = true, noremap = true })
set("n", "<leader>dh", ":call vimspector#ToggleBreakpoint()<cr>", { silent = true, noremap = true })
set("n", "<leader>dH", ":call vimspector#ClearBreakpoints()<cr>", { silent = true, noremap = true })
set("n", "<leader>db", "<Plug>VimspectorBreakpoints<cr>", { silent = true, noremap = true })
set("n", "<leader>dw", "<Plug>VimspectorBalloonEval<cr>", { silent = true, noremap = true })
