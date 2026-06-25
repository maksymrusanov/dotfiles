return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				htmldjango = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
				python = { "ruff", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})
	end,
}
