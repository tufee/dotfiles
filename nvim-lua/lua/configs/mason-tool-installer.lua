local status, mason_tool = pcall(require, "mason-tool-installer")

if not status then
	return
end

mason_tool.setup({
	ensure_installed = {
		"gofumpt",
		"goimports-reviser",
		"golines",
		"prettierd",
		"stylua",
		"yamlfmt",
	},
	auto_update = false,
	run_on_start = true,
})
