local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load("settings")
load("keymaps")
load("themes")

load("plugins.autopairs")
load("plugins.autotag")
load("plugins.bufferline")
load("plugins.cmp")
load("plugins.indent-blankline")
load("plugins.lsp-config")
load("plugins.lspkind")
load("plugins.lualine")
load("plugins.null-ls")
load("plugins.nvim-tree")
load("plugins.packer")
load("plugins.telescope")
load("plugins.toggle-term")

