local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
	{
		"wakatime/vim-wakatime",
		event = "VeryLazy",
	},

	{
		"nvim-java/nvim-java",
		ft = { "java" },
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("java").setup({
				-- Instala Java 21 automaticamente apenas para o JDTLS rodar
				-- Seus projetos continuam usando Java 17
				jdk = {
					auto_install = true,
				},
			})

			-- Adicionar keymaps do LSP quando JDTLS conectar
			vim.api.nvim_create_autocmd("LspAttach", {
				pattern = "*.java",
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					if client and client.name == "jdtls" then
						local bufopts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
						vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
						vim.keymap.set("n", "[d", function()
							vim.diagnostic.jump({ count = -1, float = true })
						end, bufopts)
						vim.keymap.set("n", "]d", function()
							vim.diagnostic.jump({ count = 1, float = true })
						end, bufopts)
						vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
						vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, bufopts)
						vim.keymap.set("n", "<space>f", function()
							require("conform").format()
						end, bufopts)
					end
				end,
			})
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{ "<C-N>", ":Neotree toggle<CR>", desc = "Toggle Neotree" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
				},
			})
		end,
	},

	{ "nvim-neotest/nvim-nio", lazy = true },

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescriptreact = { "prettierd" },
					yaml = { "yamlfmt" },
					json = { "jq" },
					go = { "gofumpt", "goimports-reviser", "golines" },
					java = { "google-java-format" },
				},
				formatters = {
					["google-java-format"] = {
						command = "google-java-format",
						args = { "-" },
						stdin = true,
					},
				},
			})
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- UI
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
	},

	{
		"onsails/lspkind.nvim",
		lazy = true,
	},

	{
		"nvim-neotest/neotest",
		cmd = "Neotest",
		keys = {
			{ "<leader>tn", ':lua require("neotest").run.run()<CR>', desc = "Run nearest test" },
			{ "<leader>tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = "Run file tests" },
			{ "<leader>td", ':lua require("neotest").run.run({strategy = "dap"})<CR>', desc = "Debug test" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/neotest-go",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						dap = { justMyCode = false },
					}),
					require("neotest-go"),
				},
			})
		end,
	},

	{ "nvim-lua/plenary.nvim", lazy = true },

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<Leader><Leader>", ":Telescope buffers<CR>", desc = "Find buffers" },
			{ "<C-F>", ":Telescope live_grep<CR>", desc = "Live grep" },
			{
				"<C-p>",
				"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
				desc = "Find files",
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						"%.git/",
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})
			-- Carregar fzf nativo se disponível
			pcall(require("telescope").load_extension, "fzf")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"cmp-nvim-lsp",
			"mason.nvim",
			"mason-lspconfig.nvim",
		},
		config = function()
			-- Configurar diagnósticos globalmente
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})

			-- Definir símbolos de diagnóstico
			local signs = { Error = " ", Warning = " ", Hint = "💡", Information = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
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
			"onsails/lspkind.nvim",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- Inicializar lspkind com ícones personalizados
			lspkind.init({
				mode = "symbol_text",
				preset = "codicons",
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-b>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<C-e>"] = cmp.mapping.abort(),
					["<Esc>"] = cmp.mapping.close(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
				},
				completion = {
					keyword_length = 1,
					completeopt = "menu,noselect",
				},
				view = {
					entries = "custom",
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						menu = {
							nvim_lsp = "λ",
							path = "[PATH]",
							buffer = "Ω",
							nvim_lua = "🌙",
							luasnip = "🌕",
						},
					}),
				},
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{ "<leader>cm", ":Mason<CR>", desc = "Mason" },
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"nvim-lspconfig",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local masonlsp = require("mason-lspconfig")

			-- Definir capabilities com suporte a nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Função organize_imports para TypeScript
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				local clients = vim.lsp.get_clients({ bufnr = 0, name = "ts_ls" })
				if clients[1] then
					clients[1]:exec_cmd(params)
				end
			end

			-- Função on_attach com keymaps LSP
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "gs", ":OrganizeImports<CR>", bufopts)
				vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, bufopts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "<space>f", function()
					require("conform").format()
				end)
			end

			-- Configurar mason-lspconfig com handlers
			masonlsp.setup({
				automatic_installation = true,
				ensure_installed = {
					"dockerls",
					"docker_compose_language_service",
					"graphql",
					"jsonls",
					"vimls",
					"lua_ls",
					"sqlls",
					"yamlls",
					"prismals",
					"eslint",
					"cssls",
					"html",
					"ts_ls",
					"gopls",
					"jdtls",
				},
				handlers = {
					-- Handler padrão para todos os servidores
					function(server_name)
						-- Ignorar jdtls - será configurado pelo nvim-java
						if server_name == "jdtls" then
							return
						end
						lspconfig[server_name].setup({
							on_attach = on_attach,
							capabilities = capabilities,
						})
					end,

					-- Configurações específicas por servidor
					["ts_ls"] = function()
						lspconfig.ts_ls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							commands = {
								OrganizeImports = {
									organize_imports,
									description = "Organize Imports",
								},
							},
						})
					end,

					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									diagnostics = {
										globals = { "vim" },
										disable = {
											"duplicate-set-field",
											"undefined-field",
											"inject-field",
											"duplicate-doc-field",
										},
									},
									workspace = {
										checkThirdParty = false,
										library = vim.api.nvim_get_runtime_file("", true),
									},
									telemetry = {
										enable = false,
									},
									completion = {
										callSnippet = "Replace",
									},
								},
							},
						})
					end,

					["yamlls"] = function()
						lspconfig.yamlls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								yaml = {
									format = {
										enable = true,
									},
									hover = true,
									completion = true,
									customTags = {
										"!Base64",
										"!Cidr",
										"!FindInMap sequence",
										"!GetAtt",
										"!GetAZs",
										"!ImportValue",
										"!Join sequence",
										"!Ref",
										"!Select sequence",
										"!Split sequence",
										"!Sub sequence",
										"!Sub",
										"!And sequence",
										"!Condition",
										"!Equals sequence",
										"!If sequence",
										"!Not sequence",
										"!Or sequence",
									},
								},
							},
						})
					end,

					["gopls"] = function()
						lspconfig.gopls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							filetypes = { "go", "gomod", "gowork", "gotmpl" },
							root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
							settings = {
								gopls = {
									completeUnimported = true,
									usePlaceholders = true,
									analyses = {
										unusedparams = true,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"gofumpt",
					"goimports-reviser",
					"golines",
					"prettierd",
					"stylua",
					"yamlfmt",
					"jq",
					"google-java-format",
				},
				auto_update = false,
				run_on_start = false,
			})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<F2>",
				function()
					require("dap").clear_breakpoints()
				end,
				desc = "DAP Clear Breakpoints",
			},
			{
				"<F4>",
				function()
					require("dap").run_last()
				end,
				desc = "DAP Run Last",
			},
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "DAP Continue",
			},
			{
				"<F9>",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "DAP Toggle Breakpoint",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "DAP Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "DAP Step Into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "DAP Step Out",
			},
		},
		config = function()
			local dap = require("dap")

			-- Definir símbolos de breakpoint visíveis
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "" })

			-- Configurar adapter para js-debug se instalado
			local mason_registry_ok, mason_registry = pcall(require, "mason-registry")
			if mason_registry_ok then
				local package_ok, js_debug_package = pcall(mason_registry.get_package, "js-debug-adapter")
				if package_ok and js_debug_package then
					local install_path_ok, js_debug_path =
						pcall(js_debug_package.get_install_path, js_debug_package)
					if install_path_ok and js_debug_path then
						dap.adapters["pwa-node"] = {
							type = "server",
							host = "localhost",
							port = "${port}",
							executable = {
								command = "node",
								args = {
									js_debug_path .. "/js-debug/src/dapDebugServer.js",
									"${port}",
								},
							},
						}
					end
				end
			end

			-- Configurações para JavaScript/TypeScript
			for _, language in ipairs({ "typescript", "javascript" }) do
				if not dap.configurations[language] then
					dap.configurations[language] = {
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
						},
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach",
							cwd = "${workspaceFolder}",
						},
					}
				end
			end

			-- Java fallback (se nvim-java-dap não configurar)
			if not dap.adapters.java then
				dap.adapters.java = function(callback)
					callback({
						type = "server",
						host = "127.0.0.1",
						port = 5005,
					})
				end
			end

			if not dap.configurations.java then
				dap.configurations.java = {
					{
						type = "java",
						request = "attach",
						name = "Debug (Attach) - Remote",
						hostName = "127.0.0.1",
						port = 5005,
					},
				}
			end
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		lazy = false, -- Carregar eagerly para garantir que listeners funcionem
		keys = {
			{
				"<F1>",
				function()
					require("dapui").eval()
				end,
				desc = "DAP UI Eval",
			},
			{
				"<F3>",
				function()
					require("dap").disconnect()
					require("dapui").close()
				end,
				desc = "DAP Disconnect",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "DAP UI Toggle",
			},
			{
				"<leader>dw",
				function()
					require("dapui").eval()
				end,
				desc = "DAP UI Eval",
			},
			{
				"<leader>dT",
				function()
					require("dap").clear_breakpoints()
				end,
				desc = "DAP Clear Breakpoints",
			},
		},
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			-- Setup básico do DAP UI
			dapui.setup()

			-- Abrir/fechar DAP UI automaticamente quando debug inicia/termina
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<C-t>", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "n", "t" } },
		},
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-t>]],
				-- direction = "float",
				float_opts = {
					border = "curved",
				},
			})

			-- Configurar keymaps do terminal
			local function set_terminal_keymaps()
				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
			end

			-- Aplicar keymaps quando o terminal abrir
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = set_terminal_keymaps,
			})
		end,
	},

	{
		"numtostr/comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	{
		"tpope/vim-surround",
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				incremental_selection = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				ensure_installed = { "lua", "vim", "markdown" },
				auto_install = true,
			})
		end,
	},

	-- Themes
	{ "morhetz/gruvbox", lazy = true },
	{ "shatur/neovim-ayu", priority = 1000 },
	{ "cpea2506/one_monokai.nvim", lazy = true },
	{ "catppuccin/nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
	{ "navarasu/onedark.nvim",  lazy = true }, -- Tema ativo carregado primeiro
}, {
	-- Configurações de performance do lazy.nvim
	defaults = {
		lazy = false,
		version = false,
	},
	install = {
		colorscheme = { "onedark" },
	},
	checker = {
		enabled = false, -- Não verificar atualizações automaticamente
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
