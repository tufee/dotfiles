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

vim.fn.setenv("OPENAI_API_KEY", "")

require("lazy").setup({

  -- ({
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     require("nvim-autopairs").setup()
  --   end,
  -- })

  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },

  {
    'styled-components/vim-styled-components',
  },

  {
    'rmagatti/session-lens',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup()
    end
  },

  {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  },

  { "nvim-lua/plenary.nvim",    lazy = true },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('configs.notify')
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    tag = "0.1.1",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  {
    "nvim-pack/nvim-spectre",
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

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("configs.chatgpt")
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },

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
    keys = {
      { "<C-T>", "<cmd>Toggleterm<cr>" },
    },
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
  { "pangloss/vim-javascript",  lazy = false },
  { "MaxMEllon/vim-jsx-pretty", lazy = false },
  { "jparise/vim-graphql",      lazy = true },
  { "prisma/vim-prisma",        lazy = true },

  {
    "puremourning/vimspector",
    lazy = true,
    keys = {
      { "<leader>dh", ":call vimspector#ToggleBreakpoint()<cr>" },
    },
  },

  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
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

  {
    "tiagovla/scope.nvim",
    config = function()
      require('scope').setup()
    end,
  },

  {
    "onsails/lspkind.nvim",
    lazy = true,
    config = function()
      require('configs.lspkind')
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
  },

  -- Themes
  { "morhetz/gruvbox",             lazy = true },
  { "shatur/neovim-ayu",           lazy = true },
  { "cpea2506/one_monokai.nvim",   lazy = true },
  { "catppuccin/nvim",             lazy = false },
})
