-- ─────────────────────────────────────────────
-- LSP setup (Neovim 0.11+)
-- ─────────────────────────────────────────────

local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function(_, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, {
			buffer = bufnr,
			desc = desc,
		})
	end

	map("gd", vim.lsp.buf.definition, "Go to definition")
	map("gr", vim.lsp.buf.references, "References")
	map("K", vim.lsp.buf.hover, "Hover")
	map("<leader>rn", vim.lsp.buf.rename, "Rename")
	map("<leader>ca", vim.lsp.buf.code_action, "Code action")

	map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
	map("]d", vim.diagnostic.goto_next, "Next diagnostic")
end

local servers = {

	pyright = {},

	lua_ls = {

		settings = {

			Lua = {

				diagnostics = {
					globals = {
						"vim",
					},
				},

				workspace = {
					checkThirdParty = false,
				},
			},
		},
	},

	clangd = {},

	rust_analyzer = {},

	cssls = {},

	html = {},

	emmet_ls = {},

	dockerls = {},

	docker_compose_language_service = {},
}

for server, config in pairs(servers) do
	vim.lsp.config(server, {

		capabilities = capabilities,

		on_attach = on_attach,

		settings = config.settings,
	})

	vim.lsp.enable(server)
end

-- ─────────────────────────────────────────────
-- Diagnostics
-- ─────────────────────────────────────────────

vim.diagnostic.config({

	virtual_text = true,

	signs = true,

	underline = true,

	update_in_insert = false,

	severity_sort = true,
})
