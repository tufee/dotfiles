local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
	return
end

masonlsp.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		"dockerls",
		"graphql",
		"jsonls",
		"tsserver",
		"sqlls",
		"yamlls",
		"eslint",
	},
})
