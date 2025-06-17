require("neotest").setup({
	adapters = {
		require("neotest-jest")({
			dap = { justMyCode = false },
		}),
		require("neotest-go"),
	},
})
