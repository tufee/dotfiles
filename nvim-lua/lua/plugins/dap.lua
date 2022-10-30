local dap = require("dap")
require("nvim-dap-virtual-text").setup()

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })

dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

local function debugJest(testName, filename)
  print("starting " .. testName .. " in " .. filename)
  dap.run({
    type = "node2",
    request = "launch",
    cwd = vim.fn.getcwd(),
    runtimeArgs = { "--inspect-brk", "/usr/local/bin/jest", "--no-coverage", "-t", testName, "--", filename },
    sourceMaps = true,
    protocol = "inspector",
    skipFiles = { "<node_internals>/**/*.js" },
    console = "integratedTerminal",
    port = 9229,
  })
end

local function attach()
  print("attaching")
  dap.run({
    type = "node2",
    request = "attach",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    skipFiles = { "<node_internals>/**/*.js" },
  })
end

local function attachToRemote()
  print("attaching")
  dap.run({
    type = "node2",
    request = "attach",
    address = "127.0.0.1",
    port = 9229,
    localRoot = vim.fn.getcwd(),
    remoteRoot = "/home/vcap/app",
    sourceMaps = true,
    protocol = "inspector",
    skipFiles = { "<node_internals>/**/*.js" },
  })
end

return {
  debugJest = debugJest,
  attach = attach,
  attachToRemote = attachToRemote,
}
