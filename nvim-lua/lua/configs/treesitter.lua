local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    disable = {},
    -- additional_vim_regex_highlighting = true,
  },
  incremental_selection = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "prisma",
    "regex",
    "sql",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
})
