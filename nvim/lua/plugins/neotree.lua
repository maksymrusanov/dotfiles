return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		local neotree = require("neo-tree")

		neotree.setup({
			close_if_last_window = true,
			popup_border_style = "rounded",

			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_hidden = false,
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				hijack_netrw_behavior = "open_current",
			},

			window = {
				width = 40,
			},

			default_component_configs = {
				container = { enable_character_fade = false },
				modified = { symbol = "✚" },

				name = {
					trailing_slash = false,
					use_git_status_colors = true,
				},

				git_status = {
					symbols = {
						added = "+",
						modified = "M",
						deleted = "D",
						renamed = "R",
						untracked = "U",
						ignored = "I",
						unstaged = "-",
						staged = "S",
						conflict = "C",
					},
				},
			},
		})
	end,

	keys = {
		{
			"<C-t>",
			function()
				local file = vim.api.nvim_buf_get_name(0)
				local path = file ~= "" and vim.fs.dirname(file) or vim.loop.cwd()

				require("neo-tree.command").execute({
					toggle = true,
					position = "right",
					hide_dotfiles = false,
					hide_hidden = false,
					dir = path,
				})
			end,
			mode = { "n", "v" },
			desc = "Neo-tree current file folder",
		},
	},
}
