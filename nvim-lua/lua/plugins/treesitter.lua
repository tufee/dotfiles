require('nvim-treesitter.configs').setup{
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = "all",
}
