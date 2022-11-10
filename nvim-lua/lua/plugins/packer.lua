local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print("Installing packer...")
  local packer_url = "https://github.com/wbthomason/packer.nvim"
  vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
  print("Done.")

  vim.cmd("packadd packer.nvim")
  install_plugins = true
end

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("wakatime/vim-wakatime")

  -- use("mfussenegger/nvim-dap")
  -- use("theHamsta/nvim-dap-virtual-text")
  -- use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

  use "lukas-reineke/indent-blankline.nvim"
  use('tpope/vim-vinegar')
  use('puremourning/vimspector')
  -- Theme
  use("sfi0zy/atlantic-dark.vim")
  use("owickstrom/vim-colors-paramount")
  use("morhetz/gruvbox")
  use("ayu-theme/ayu-vim")
  use("bluz71/vim-moonfly-colors")
  use("srcery-colors/srcery-vim")
  use("drewtempelmeyer/palenight.vim")
  use("franbach/miramare")
  use("sainnhe/everforest")
  use({ "dracula/vim", as = "dracula" })
  use({ "pineapplegiant/spaceduck", branch = "main" })
  use("cpea2506/one_monokai.nvim")
  use("challenger-deep-theme/vim")
  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

  -- Airline
  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")

  use("onsails/lspkind.nvim")
  use("matze/vim-move")

  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-treesitter/nvim-treesitter")

  -- LSPs
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use("neovim/nvim-lspconfig")

  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use("jose-elias-alvarez/null-ls.nvim")

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lua")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("ray-x/cmp-treesitter")

  use("rafamadriz/friendly-snippets")
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
  use({ "vim-test/vim-test" })

  if install_plugins then
    require("packer").sync()
  end
end)

if install_plugins then
  return
end
