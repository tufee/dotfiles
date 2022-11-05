require("nvim-treesitter.configs").setup({
  autotag = {
    enable = false,
  },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = "all",
})
