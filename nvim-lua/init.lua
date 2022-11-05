local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load("settings")
load("keymaps")
load("themes")

load("plugins.lualine")
load("plugins.cmp")
load("plugins.dap")
load("plugins.lsp-config")
load("plugins.null-ls")
load("plugins.lspkind")
load("plugins.packer")
load("plugins.telescope")
load("plugins.autopairs")
load("plugins.autotag")
load("plugins.vim-test")
