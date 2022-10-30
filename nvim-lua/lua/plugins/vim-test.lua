local set = vim.keymap.set

local dap = require("dap")

set("n", "tt", ":TestNearest<CR>", { silent = true, desc = "Remove highlight in the search" })
set("n", "tf", ":TestFile<CR>", { silent = true, desc = "Remove highlight in the search" })
set("n", "ts", ":TestSuite<CR>", { silent = true, desc = "Remove highlight in the search" })
set("n", "t_", ":TestLast<CR>", { silent = true, desc = "Remove highlight in the search" })

vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "horizontal"
vim.g["test#enabled_runners"] = { "javascript#mocha" }
vim.g["test#javascript#runner"] = "mocha"

function debugMocha(testName, filename)
  print("starting " .. testName .. " in " .. filename)
  dap.run({
    type = "node2",
    request = "launch",
    cwd = vim.fn.getcwd(),
    runtimeArgs = { "--inspect-brk", "./node_modules/.bin/mocha", "--no-coverage", "-t", testName, "--", filename },
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

function attachToRemote()
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
  debugMocha = debugMocha,
  attach = attach,
  attachToRemote = attachToRemote,
}
