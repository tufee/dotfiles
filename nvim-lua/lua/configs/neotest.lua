require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      dap = { justMyCode = false },
    }),
  },
})
