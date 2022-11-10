local dap = require("dap")
require("nvim-dap-virtual-text").setup()

require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })

dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      name = "Launch",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      name = "Attach to node process",
      type = "pwa-node",
      request = "attach",
      rootPath = "${workspaceFolder}",
      processId = "${processId}"
    },
  }
end

-- dap.adapters.node2 = {
--   type = "executable",
--   command = "node",
--   args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
-- }

-- local function debugJest(testName, filename)
--   print("starting " .. testName .. " in " .. filename)
--   dap.run({
--     type = "node2",
--     request = "launch",
--     cwd = vim.fn.getcwd(),
--     runtimeArgs = { "--inspect-brk", "/usr/local/bin/jest", "--no-coverage", "-t", testName, "--", filename },
--     sourceMaps = true,
--     protocol = "inspector",
--     skipFiles = { "<node_internals>/**/*.js" },
--     console = "integratedTerminal",
--     port = 9229,
--   })
-- end

-- local function attach()
--   print("attaching")
--   dap.run({
--     type = "node2",
--     request = "attach",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     skipFiles = { "<node_internals>/**/*.js" },
--   })
-- end

-- local function attachToRemote()
--   print("attaching")
--   dap.run({
--     type = "node2",
--     request = "attach",
--     address = "127.0.0.1",
--     port = 9229,
--     localRoot = vim.fn.getcwd(),
--     remoteRoot = "/home/vcap/app",
--     sourceMaps = true,
--     protocol = "inspector",
--     skipFiles = { "<node_internals>/**/*.js" },
--   })
-- end

-- return {
--   debugJest = debugJest,
--   attach = attach,
--   attachToRemote = attachToRemote,
-- }
