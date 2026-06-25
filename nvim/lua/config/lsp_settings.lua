-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		local function show_diagnostic()
			vim.diagnostic.open_float(nil, {
				focus = false,
				scope = "line",
			})
		end

		local function jump_diagnostic(count, severity)
			vim.diagnostic.jump({
				count = count,
				severity = severity,
			})

			vim.schedule(show_diagnostic)
		end

		-- Diagnostics navigation
		vim.keymap.set("n", "]d", function()
			jump_diagnostic(1)
		end, opts)

		vim.keymap.set("n", "[d", function()
			jump_diagnostic(-1)
		end, opts)

		vim.keymap.set("n", "]e", function()
			jump_diagnostic(1, vim.diagnostic.severity.ERROR)
		end, opts)

		vim.keymap.set("n", "[e", function()
			jump_diagnostic(-1, vim.diagnostic.severity.ERROR)
		end, opts)

		vim.keymap.set("n", "]w", function()
			jump_diagnostic(1, vim.diagnostic.severity.WARN)
		end, opts)

		vim.keymap.set("n", "[w", function()
			jump_diagnostic(-1, vim.diagnostic.severity.WARN)
		end, opts)

		vim.keymap.set("n", "<Leader>ge", show_diagnostic, opts)

		-- LSP navigation
		vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<Leader>go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<Leader>gs", vim.lsp.buf.signature_help, opts)

		-- LSP actions
		vim.keymap.set({ "n", "x" }, "<F3>", function()
			require("conform").format({
				async = true,
				timeout_ms = 3000,
				lsp_fallback = true,
			})
		end, opts)
		vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

		-- Toggle diagnostics display
		vim.keymap.set("n", "<Leader>tdd", function()
			local cfg = vim.diagnostic.config()

			local lines_enabled = cfg.virtual_lines == true
			local text_enabled = cfg.virtual_text ~= false

			vim.diagnostic.config({
				virtual_lines = not lines_enabled,
				virtual_text = not text_enabled,
			})
		end, { buffer = event.buf, desc = "Toggle diagnostics" })
	end,
})
local capabilities = {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
	capabilities = capabilities,
	root_markers = { ".git" },
})

vim.lsp.enable({
	"pyright",
	"luals",
	"css_lsp",
	"html",
	"htmx",
	"djangohtml",
	"emmet",
	"rust",
	"dockerls",
	"docker_compose_language_service",
})
