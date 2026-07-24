-- ─────────────────────────────────────────────
-- Plugin manager (vim.pack)
-- ─────────────────────────────────────────────

vim.pack.add({
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-neotest/nvim-nio",

	-- UI
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/trouble.nvim",

	-- completion
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",

	-- formatting
	"https://github.com/stevearc/conform.nvim",

	-- LSP
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

	-- syntax
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",

	-- utils
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/lukas-reineke/virt-column.nvim",
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/echasnovski/mini.cursorword",

	-- telescope/finder
	"https://github.com/dmtrKovalenko/fff.nvim",

	-- terminal
	"https://github.com/akinsho/toggleterm.nvim",

	-- markdown
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",

	-- colors
	"https://github.com/bluz71/vim-moonfly-colors",

	-- misc
	"https://github.com/kylechui/nvim-surround",
	"https://github.com/rachartier/tiny-code-action.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/mbbill/undotree",
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/ray-x/lsp_signature.nvim",
	"https://github.com/brenton-leighton/multiple-cursors.nvim",
})

-- ─────────────────────────────────────────────
-- Theme
-- ─────────────────────────────────────────────

vim.cmd.colorscheme("moonfly")

vim.api.nvim_set_hl(0, "Normal", {
	bg = "none",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
	bg = "none",
})

vim.api.nvim_set_hl(0, "SignColumn", {
	bg = "none",
})

vim.api.nvim_set_hl(0, "LineNr", {
	bg = "none",
})

-- ─────────────────────────────────────────────
-- Neo-tree
-- ─────────────────────────────────────────────

require("neo-tree").setup({
	window = {
		position = "right",
	},

	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
		},
	},
})

-- ─────────────────────────────────────────────
-- Autopairs
-- ─────────────────────────────────────────────

require("nvim-autopairs").setup()

-- ─────────────────────────────────────────────
-- Blink completion
-- ─────────────────────────────────────────────

require("blink.cmp").setup({

	keymap = {
		preset = "enter",
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = false,
		},
	},

	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
	},
})
-- ─────────────────────────────────────────────
-- Mason
-- ─────────────────────────────────────────────

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"cssls",
		"html",
		"emmet_ls",
		"dockerls",
		"docker_compose_language_service",
		"rust_analyzer",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"ruff",
		"black",
		"isort",
		"prettier",
		"stylua",
		"clang-format",
	},
})

-- ─────────────────────────────────────────────
-- Conform formatter
-- ─────────────────────────────────────────────

local conform = require("conform")

conform.setup({

	formatters_by_ft = {

		python = {
			"ruff_organize_imports",
			"ruff_format",
		},

		lua = {
			"stylua",
		},

		javascript = {
			"prettier",
		},

		typescript = {
			"prettier",
		},

		html = {
			"prettier",
		},

		css = {
			"prettier",
		},

		htmldjango = {
			"prettier",
		},

		json = {
			"prettier",
		},

		yaml = {
			"prettier",
		},

		dockerfile = {
			"prettier",
		},

		c = {
			"clang_format",
		},

		cpp = {
			"clang_format",
		},
	},

	format_on_save = {
		timeout_ms = 3000,
		async = false,
		lsp_fallback = true,
	},
})

-- ─────────────────────────────────────────────
-- Treesitter
-- ─────────────────────────────────────────────

require("nvim-treesitter").install({

	"bash",
	"c",
	"cpp",
	"cmake",
	"dockerfile",
	"lua",
	"python",
	"html",
	"javascript",
	"typescript",
	"json",
	"yaml",
	"markdown",
	"markdown_inline",
	"toml",
	"rust",
})

require("treesitter-context").setup({
	enable = true,
	max_lines = 3,
})

-- ─────────────────────────────────────────────
-- Indent guides
-- ─────────────────────────────────────────────

require("ibl").setup({
	indent = {
		char = "│",
	},
})

-- ─────────────────────────────────────────────
-- Colorizer
-- ─────────────────────────────────────────────

require("colorizer").setup({

	filetypes = {
		"css",
		"lua",
		"python",
		"html",
	},

	user_default_options = {

		RGB = true,
		RRGGBB = true,
		names = false,

		RRGGBBAA = true,

		rgb_fn = true,
		hsl_fn = true,

		mode = "background",

		virtualtext = "■",
	},
})

-- ─────────────────────────────────────────────
-- fff finder
-- ─────────────────────────────────────────────

vim.g.fff = {
	lazy_sync = true,
}

vim.api.nvim_create_autocmd("PackChanged", {

	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind

		if name == "fff.nvim" and (kind == "install" or kind == "update") then
			require("fff.download").download_or_build_binary()
		end
	end,
})

-- ─────────────────────────────────────────────
-- Toggle terminal
-- ─────────────────────────────────────────────

require("toggleterm").setup({

	direction = "float",

	start_in_insert = true,

	persist_mode = true,

	float_opts = {
		border = "rounded",
	},
})

-- ─────────────────────────────────────────────
-- Trouble
-- ─────────────────────────────────────────────

require("trouble").setup()

-- ─────────────────────────────────────────────
-- Mini cursorword
-- ─────────────────────────────────────────────

require("mini.cursorword").setup()

-- ─────────────────────────────────────────────
-- Surround
-- ─────────────────────────────────────────────

require("nvim-surround").setup()

-- ─────────────────────────────────────────────
-- Multiple cursors
-- ─────────────────────────────────────────────

vim.pack.add({
	"https://github.com/brenton-leighton/multiple-cursors.nvim",
})
require("multiple-cursors").setup({})
vim.keymap.set({ "n", "i", "x" }, "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", {
	desc = "Add cursor and move down",
})
vim.keymap.set({ "n", "i", "x" }, "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", {
	desc = "Add cursor and move up",
})

-- ─────────────────────────────────────────────
-- Markdown
-- ─────────────────────────────────────────────

require("render-markdown").setup({})

-- ─────────────────────────────────────────────
-- LSP signature
-- ─────────────────────────────────────────────

require("lsp_signature").setup({

	hint_enable = false,

	floating_window = true,

	handler_opts = {
		border = "single",
	},
})
-- ─────────────────────────────────────────────
-- Lualine
-- ─────────────────────────────────────────────

local colors = {
	bg = "#050505",
	bg_alt = "#141414",
	fg = "#d9d9d9",
	fg_muted = "#8a8a8a",
	red = "#ff2f2f",
	red_dark = "#a50000",
	red_dim = "#5c0a0a",
}

local theme = {

	normal = {
		a = {
			bg = colors.red,
			fg = colors.bg,
			gui = "bold",
		},

		b = {
			bg = colors.bg_alt,
			fg = colors.fg,
		},

		c = {
			bg = colors.bg,
			fg = colors.fg,
		},
	},

	insert = {
		a = {
			bg = colors.red_dark,
			fg = colors.fg,
			gui = "bold",
		},
	},

	visual = {
		a = {
			bg = colors.red_dim,
			fg = colors.fg,
			gui = "bold",
		},
	},
}

local function lsp()
	local clients = vim.lsp.get_clients({
		bufnr = 0,
	})

	if #clients == 0 then
		return ""
	end

	return "LSP:" .. clients[1].name
end

require("lualine").setup({

	options = {

		theme = theme,

		component_separators = "",

		section_separators = "",

		globalstatus = true,
	},

	sections = {

		lualine_a = {
			"mode",
		},

		lualine_b = {
			"branch",
		},

		lualine_c = {

			{
				"filename",

				path = 2,
			},
		},

		lualine_x = {

			"diagnostics",

			lsp,
		},

		lualine_z = {

			"location",
		},
	},
})

-- ─────────────────────────────────────────────
-- Dashboard (Snacks)
-- ─────────────────────────────────────────────

require("snacks").setup({

	input = {
		enabled = true,
	},

	picker = {
		enabled = true,
	},

	dashboard = {

		preset = {

			header = [[

 ███╗   ██╗██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██║   ██║██║████╗ ████║
 ██╔██╗ ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

            ]],
		},

		sections = {

			{
				section = "header",
			},

			{
				section = "keys",
				gap = 1,
				padding = 1,
			},

			{
				section = "recent_files",
				padding = 1,
			},
		},
	},
})

-- ─────────────────────────────────────────────
-- UndoTree
-- ─────────────────────────────────────────────

vim.g.undotree_WindowLayout = 2

vim.g.undotree_DiffpanelHeight = 8

vim.keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", {
	desc = "UndoTree",
})

-- ─────────────────────────────────────────────
-- Rainbow delimiters
-- ─────────────────────────────────────────────

require("rainbow-delimiters.setup").setup({

	highlight = {

		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
})

-- ─────────────────────────────────────────────
-- Tiny code action
-- ─────────────────────────────────────────────

require("tiny-code-action").setup()

-- ─────────────────────────────────────────────
-- Virtual column
-- ─────────────────────────────────────────────

require("virt-column").setup()

-- ─────────────────────────────────────────────
-- Cursor line
-- ─────────────────────────────────────────────

vim.api.nvim_set_hl(0, "CursorLine", {
	bg = "#1e1e1e",
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
	fg = "#ffffff",
	bold = true,
})
