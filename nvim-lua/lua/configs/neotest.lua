require("neotest").setup({
  adapters = {
    require('neotest-vitest')({
      dap = { justMyCode = false },
    }),
  },
})
