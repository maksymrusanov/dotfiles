return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"html",
				"cssls",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"rust-analyzer",
				"hadolint",
			},
		},
		dependencies = {
			{

				"williamboman/mason.nvim",
				lazy = false,
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"rust-analyzer",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
