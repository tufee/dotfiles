require('Comment').setup()

vim.api.nvim_set_keymap('v', '/', [[<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment"]], { noremap = true, silent = true })
