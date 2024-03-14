local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end

local signs = { Error = " ", Warning = " ", Hint = "💡", Information = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
})

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gs", ':OrganizeImports<CR>', bufopts)
  vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "[a", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "]a", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set("n", "<space>f", function()
  --   vim.lsp.buf.format({ async = true })
  -- end, bufopts)
  vim.keymap.set("n", "<space>f", function()
   require("conform").format()
  end)
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.graphql.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

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

lspconfig.prismals.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- lspconfig.tsserver.setup({})
