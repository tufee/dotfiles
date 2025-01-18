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

require("lazy").setup({
	{ "wakatime/vim-wakatime" },

	-- { "fatih/vim-go" },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("configs.neotree")
		end,
	},

	{ "nvim-neotest/nvim-nio" },

	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	-- UI
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			opt = true,
		},
		config = function()
			require("configs.lualine")
		end,
	},

	{
		"onsails/lspkind.nvim",
		config = function()
			require("configs.lspkind")
		end,
	},

	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("configs.neotest")
		end,
	},

	{ "nvim-lua/plenary.nvim", lazy = true },

	{
		"rcarriga/nvim-notify",
		config = function()
			require("configs.notify")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
					},
				},
			})
		end,

		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = "cmp-nvim-lsp",
		config = function()
			require("configs.lsp-config")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("configs.cmp")
		end,
	},

	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("configs.copilot")
	-- 	end,
	-- },
	--
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	dependencies = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 			formatters = {
	-- 				insert_text = require("copilot_cmp.format").remove_existing,
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				opts = {
					registries = {
						"github:mason-org/mason-registry",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason")
		end,
		dependencies = { "mason.nvim" },
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			require("configs.dap")
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("configs.dap-ui")
		end,
	},

	-- {
	--   'theHamsta/nvim-dap-virtual-text',
	--   dependencies = { 'mfussenegger/nvim-dap' },
	--   config = function()
	--     require('nvim-dap-virtual-text').setup()
	--   end
	-- },

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("configs.toggle-term")
		end,
	},

	{
		"numtostr/comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{ "tpope/vim-surround" },

	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.treesitter")
		end,
	},

	-- Themes
	{ "morhetz/gruvbox", lazy = false },
	{ "shatur/neovim-ayu", lazy = true },
	{ "cpea2506/one_monokai.nvim", lazy = true },
	{ "catppuccin/nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "navarasu/onedark.nvim", lazy = true },
})
