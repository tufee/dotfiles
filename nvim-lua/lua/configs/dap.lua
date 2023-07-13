require('mason-nvim-dap').setup({
  vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' }),
  ensure_installed = { 'node2'},
  handlers = {},
})

