local g = vim.g
local set = vim.opt
local path = vim.fn.expand("~/.config")

g.mapleader = " "
g.netrw_banner = 0
g.netrw_winsize = 15
set.list = true
set.listchars = { eol = " ", trail = "·", nbsp = "." }
set.termguicolors = true
set.signcolumn = "yes"
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.cursorline = false
set.number = true
set.relativenumber = true
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
set.completeopt = { "menuone", "noselect" }
set.virtualedit = "all"
set.scrolloff = 8
set.updatetime = 50
set.colorcolumn = "80"

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
