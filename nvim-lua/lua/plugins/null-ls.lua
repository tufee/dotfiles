local formatting = require("null-ls").builtins.formatting

require("null-ls").setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
  },
})
