---@type vim.lsp.Config
return {
	cmd = { "emmet-language-server", "--stdio" },
	filetypes = {
		"css",
		"eruby",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"typescriptreact",
	},
	root_markers = { ".git" },
}
