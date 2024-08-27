require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    yaml = { "yamlfmt" },
    json = { "jq" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    -- xml = { "xmlformatter" }
  },
})
