-- ─────────────────────────────────────────────
-- LSP setup (Neovim 0.11+)
-- ─────────────────────────────────────────────

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- ─────────────────────────────────────────────
-- Keymaps
-- ─────────────────────────────────────────────

local on_attach = function(_, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, {
			buffer = bufnr,
			desc = desc,
			silent = true,
		})
	end

	-- Navigation
	map("gd", vim.lsp.buf.definition, "Go to definition")
	map("gr", vim.lsp.buf.references, "References")
	map("K", vim.lsp.buf.hover, "Hover")

	-- Actions
	map("<leader>rn", vim.lsp.buf.rename, "Rename")
	map("<leader>ca", vim.lsp.buf.code_action, "Code action")

	-- Diagnostics (Neovim 0.11+)
	map("[d", function()
		vim.diagnostic.jump({
			count = -1,
			float = true,
		})
	end, "Previous diagnostic")

	map("]d", function()
		vim.diagnostic.jump({
			count = 1,
			float = true,
		})
	end, "Next diagnostic")
end

-- ─────────────────────────────────────────────
-- LSP Servers
-- ─────────────────────────────────────────────

local servers = {

	-- Python
	pyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
				},
			},
		},
	},

	ruff = {},

	-- Lua
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},

				workspace = {
					checkThirdParty = false,
				},
			},
		},
	},

	-- C / C++
	clangd = {},

	-- Rust
	rust_analyzer = {},

	-- Web
	cssls = {},
	html = {},
	emmet_ls = {},

	-- Docker
	dockerls = {},
	docker_compose_language_service = { "yaml" },
}

-- ─────────────────────────────────────────────
-- Configure LSP
-- ─────────────────────────────────────────────

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

	float = {
		border = "rounded",
		source = true,
	},
})
