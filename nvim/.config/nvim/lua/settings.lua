local g = vim.g
local set = vim.opt
local path = vim.fn.expand("~/.config")

-- Adicionar Mason ao PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Adicionar diretório de parsers ao runtimepath
set.runtimepath:append(vim.fn.expand("~/.local/share/nvim/site"))

g.mapleader = " "
-- kitty-scrollback closes Neovim immediately after a yank; xsel keeps the X11
-- clipboard selection available reliably in that flow.
g.clipboard = "xsel"
set.clipboard = "unnamedplus"
set.listchars = { eol = " ", trail = "·", nbsp = "." }
set.termguicolors = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.cursorline = false
set.number = true
set.mouse = "a"
set.swapfile = false
set.autoindent = true
set.smartindent = true
set.hidden = true
set.inccommand = "split"
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.wrap = true
set.backup = true
set.undofile = true
set.writebackup = true
set.undodir = vim.fn.stdpath("state") .. "/undo//"
set.backupdir = vim.fn.stdpath("state") .. "/backup//"
set.virtualedit = "all"
set.scrolloff = 8
set.updatetime = 50
set.colorcolumn = "100"

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
