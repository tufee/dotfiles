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

-- Formatação
set('n', '<leader>f', function()
	require("conform").format()
end)

-- LSP keymaps
set("n", "gD", vim.lsp.buf.type_definition)
set("n", "gd", vim.lsp.buf.definition)
set("n", "K", vim.lsp.buf.hover)
set("n", "gr", vim.lsp.buf.references)
set("n", "gs", function()
	local clients = vim.lsp.get_clients({ bufnr = 0, name = "ts_ls" })
	if clients[1] then
		local file = vim.api.nvim_buf_get_name(0)
		-- Adicionar imports faltando via source action
		vim.lsp.buf.code_action({
			apply = true,
			context = {
				only = { "source.addMissingImports.ts" },
				diagnostics = {},
			},
		})
		-- Organizar imports após
		vim.defer_fn(function()
			clients[1]:exec_cmd({
				command = "_typescript.organizeImports",
				arguments = { file },
			})
		end, 300)
	end
end)
set("n", "<leader>h", vim.lsp.buf.signature_help)
set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
set("n", "<leader>rn", vim.lsp.buf.rename)
set("n", "<M-CR>", vim.lsp.buf.code_action)
