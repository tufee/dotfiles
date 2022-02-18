lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"

vim.opt.virtualedit = "all"
vim.opt.wrap = true
vim.g["UltiSnipsExpandTrigger"] = "<C-j>"

lvim.keys.normal_mode = {
    ["<C-s>"] = ":w<cr>",
    ["<C-q>"] = ":q<cr>",
    ["<C-k>"] = "<Cmd>BufferKill<CR>",
    ["<C-n>"] = "<Cmd>NvimTreeToggle<CR>",
    -- ["<C-m>"] = "<Cmd>HopWord<CR>",
    -- ["<C-c>"] = "<Cmd>HopLine<CR>",
    ["<C-p>"] = "<Cmd>Telescope find_files<CR>",
    ["<C-o>"] = "<Cmd>Telescope buffers<CR>",
    ["<Tab>"] = ":bnext<CR>",
    ["<S-Tab>"] = ":bprevious<CR>",
}

vim.api.nvim_set_keymap('v', '/', [[<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment"]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '/', [[<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment"]], { noremap = true, silent = true })

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
    },
  },
}

-- ESLint
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
    },
  },
}

lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "yaml",
    "dockerfile",
    "html",
    "comment",
    "dot",
    "http",
    "markdown",
    "make",
    "regex",
    "scss",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.plugins = {
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup(
            {
                    mappings = {
                        "<C-u>",
                        "<C-d>",
                        "<C-b>",
                        "<C-f>",
                        "<C-y>",
                        "<C-e>",
                        "zt",
                        "zz",
                        "zb"
                    },
                    hide_cursor = true,
                    stop_eof = true,
                    use_local_scrolloff = false,
                    respect_scrolloff = false,
                    cursor_scrolls_alone = true,
                    easing_function = nil,
                    pre_hook = nil,
                    post_hook = nil
            }
            )
        end
    },
    { "tpope/vim-repeat" },
    {
        "tpope/vim-surround",
        keys = { "c", "d", "y" }
    },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
        end
    },
    { 'TimUntersberger/neogit' },
     {'SirVer/ultisnips'},
    {'mlaursen/vim-react-snippets'}
} 
