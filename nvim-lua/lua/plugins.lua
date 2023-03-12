local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })

  use("nvim-lua/plenary.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("configs.telescope")
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    after = "cmp-nvim-lsp",
    config = function()
      require("configs.lsp-config")
    end,
  })

  use({
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*",
  })

  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    requires = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp"},
      { "jose-elias-alvarez/nvim-lsp-ts-utils", after = "nvim-cmp" }
    },
    config = function()
      require("configs.cmp")
    end,
  })
  --use("hrsh7th/cmp-copilot")

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lsp")
    end,
    after = "mason.nvim",
  })

  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
    require("configs.toggle-term")
  end,
  })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })

  -- JS
  use("pangloss/vim-javascript")
  use("MaxMEllon/vim-jsx-pretty")
  use("jparise/vim-graphql")
  use("prisma/vim-prisma")

  use("puremourning/vimspector")

  use("matze/vim-move")
  use("tpope/vim-surround")
  use("wakatime/vim-wakatime")

  -- UI
  use({ "akinsho/bufferline.nvim", tag = "v3.*",
    config = function()
      require("bufferline").setup()
    end
  })

  use({ "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons",
      opt = true },
    config = function()
      require('configs.lualine')
    end,
  })

  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")

  use({"onsails/lspkind.nvim",
    config = function()
      require('configs.lspkind')
    end,
  })
  use("nvim-tree/nvim-web-devicons")

  use({ "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('configs.nvim-tree')
    end,
  })

  use("RRethy/vim-illuminate")

  use({"lukas-reineke/indent-blankline.nvim",
    config = function()
      require('configs.indent-blankline')
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("configs.treesitter")
    end,
  })

  -- Themes
  use("sfi0zy/atlantic-dark.vim")
  use("owickstrom/vim-colors-paramount")
  use("morhetz/gruvbox")
  use("ayu-theme/ayu-vim")
  use("bluz71/vim-moonfly-colors")
  use("srcery-colors/srcery-vim")
  use("drewtempelmeyer/palenight.vim")
  use("franbach/miramare")
  use("sainnhe/everforest")
  use("cpea2506/one_monokai.nvim")
  use("challenger-deep-theme/vim")
  use({ "dracula/vim", as = "dracula" })
  use({ "pineapplegiant/spaceduck", branch = "main" })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

