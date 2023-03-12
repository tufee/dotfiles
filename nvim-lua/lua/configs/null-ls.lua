local status, nls = pcall(require, "null-ls")

if not status then
  return
end

local fmt = nls.builtins.formatting

require("null-ls").setup({
  sources = {
    fmt.prettier,
    fmt.stylua,
  },
})
