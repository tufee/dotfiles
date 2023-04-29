local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
  return
end

masonlsp.setup({
  automatic_installation = true,
  ensure_installed = {
    "dockerls",
    "graphql",
    "jsonls",
    "vimls",
    "lua_ls",
    "sqlls",
    "yamlls",
    "gopls",
    "prismals",
    "eslint",
    "cssls",
    "tsserver",
  },
})
