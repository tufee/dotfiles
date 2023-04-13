local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--vim.fn.setenv("OPENAI_API_KEY", "")

require("lazy").setup({

  -- ({
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     require("nvim-autopairs").setup()
  --   end,
  -- })

  { "nvim-lua/plenary.nvim", lazy = true },

  { 'rcarriga/nvim-notify',  lazy = true },

  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    tag = "0.1.1",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "cmp-nvim-lsp",
    config = function()
      require("configs.lsp-config")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "jose-elias-alvarez/nvim-lsp-ts-utils" }
    },
    config = function()
      require("configs.cmp")
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('copilot').setup()
    end
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing
        },
      })
    end
  },

  -- ({
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("configs.chatgpt")
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })


  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.mason-lsp")
    end,
    dependencies = { "mason.nvim" }
  },

  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    config = function()
      require("configs.toggle-term")
    end,
  },

  {
    'numtostr/comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("configs.neo-tree")
    end,
  },

  -- JS
  { "pangloss/vim-javascript",  lazy = true },
  { "MaxMEllon/vim-jsx-pretty", lazy = true },
  { "jparise/vim-graphql",      lazy = true },
  { "prisma/vim-prisma",        lazy = true },

  { "puremourning/vimspector",  lazy = true },

  { "tpope/vim-surround",       lazy = true },
  { "wakatime/vim-wakatime" },

  -- UI
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      opt = true
    },
    config = function()
      require('configs.lualine')
    end,
  },

  { "vim-airline/vim-airline",        lazy = true },
  { "vim-airline/vim-airline-themes", lazy = true },

  {
    "onsails/lspkind.nvim",
    lazy = true,
    config = function()
      require('configs.lspkind')
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  { "RRethy/vim-illuminate",       lazy = true },

  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    config = function()
      require('configs.indent-blankline')
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
  },

  -- Themes
  { "sfi0zy/atlantic-dark.vim",        lazy = true },
  { "owickstrom/vim-colors-paramount", lazy = true },
  { "morhetz/gruvbox",                 lazy = true },
  { "shatur/neovim-ayu",               lazy = false },
  { "bluz71/vim-moonfly-colors",       lazy = true },
  { "srcery-colors/srcery-vim",        lazy = true },
  { "drewtempelmeyer/palenight.vim",   lazy = true },
  { "franbach/miramare",               lazy = true },
  { "sainnhe/everforest",              lazy = true },
  { "cpea2506/one_monokai.nvim",       lazy = true },
  { "challenger-deep-theme/vim",       lazy = true },
  -- { "dracula/vim", as = "dracula" },
  { "pineapplegiant/spaceduck",        branch = "main", lazy = true },
  { "catppuccin/nvim",                 lazy = true },
})
