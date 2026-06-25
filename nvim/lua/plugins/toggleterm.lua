return {
	"akinsho/toggleterm.nvim",

	keys = {
		{
			"<C-q>",
			"<cmd>ToggleTerm<CR>",
			desc = "Terminal",
		},
	},

	opts = {
		direction = "float",
		start_in_insert = true,
		persist_mode = true,

		float_opts = {
			border = "rounded",
			width = function()
				return math.floor(vim.o.columns * 0.5)
			end,
			height = function()
				return math.floor(vim.o.lines * 0.5)
			end,
		},
	},
}
