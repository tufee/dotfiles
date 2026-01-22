local g = vim.g
local set = vim.opt
local path = vim.fn.expand("~/.config")

-- Adicionar Mason ao PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

g.mapleader = " "
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
set.undodir = { path .. "/nvim/undos" }
set.backupdir = { path .. "/nvim/backups" }
set.virtualedit = "all"
set.scrolloff = 8
set.updatetime = 50
set.colorcolumn = "100"

-- Filtrar avisos de deprecação específicos do spring-boot.nvim
local original_deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin, backtrace)
	-- Silenciar avisos de client.request
	if name and name:match("client%.request") then
		-- Verificar se vem do spring-boot.nvim no backtrace
		local info = debug.getinfo(3, "S")
		if info and info.source and info.source:match("spring[-_]boot%.nvim") then
			return
		end
		-- Verificar no backtrace fornecido
		if backtrace and type(backtrace) == "string" and backtrace:match("spring[-_]boot%.nvim") then
			return
		end
	end
	original_deprecate(name, alternative, version, plugin, backtrace)
end

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
