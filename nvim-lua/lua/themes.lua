local ok, _ = pcall(vim.cmd, 'colorscheme ayu')
if not ok then
  vim.cmd 'colorscheme default' -- if the above fails, then use default
end

-- local opt = vim.opt

-- require("one_monokai").setup()
-- cmd [[colorscheme catppuccin-mocha]] --" catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- Challenger deep
-- cmd [[colorscheme challenger_deep]]
-- vim.g.everforest_background = 'hard'
-- cmd [[colorscheme everforest]]
-- vim.g.everforest_backround = 'hard'
-- cmd [[colorscheme moonfly]]
-- cmd [[colorscheme draa]]
-- cmd [[colorscheme srcry]]
-- cmd [[colorscheme spaceduck]]
-- cmd [[colorscheme miramare]]
-- cmd [[colorscheme gruvbox]]
-- vim.g.gruvbox_contrast_dark= 'hard'
-- cmd [[colorscheme atlantic-dark]]
-- cmd [[colorscheme paramount]]
 -- cmd [[colorscheme ayu]] 
-- require('ayu').setup({
--     mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--     overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
-- })
-- vim.g.ayucolor= 'light'
-- vim.g.ayucolor= 'mirage'
-- vim.g.ayucolor= 'dark'
-- cmd [[colorscheme palenight]]
-- opt.background = 'dark'
