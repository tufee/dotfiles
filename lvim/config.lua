lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"

vim.opt.virtualedit = "all"
vim.opt.wrap = true

lvim.keys.normal_mode = {
    ["<C-s>"] = ":w<cr>",
    ["<C-q>"] = ":q<cr>",
    ["<C-k>"] = "<Cmd>BufferKill<CR>",
    ["<C-n>"] = "<Cmd>NvimTreeToggle<CR>",
    ["<C-m>"] = "<Cmd>HopWord<CR>",
    ["<C-c>"] = "<Cmd>HopLine<CR>",
    ["<C-p>"] = "<Cmd>Telescope find_files<CR>",
    ["<C-o>"] = "<Cmd>Telescope buffers<CR>",
    ["<Tab>"] = ":bnext<CR>",
    ["<S-Tab>"] = ":bprevious<CR>"
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        exe = "prettier",
        args = { "--print-width", "100" }
    }
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
    "yaml"
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
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end
    }
}
