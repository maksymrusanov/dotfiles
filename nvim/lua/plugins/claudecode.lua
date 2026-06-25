return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		focus_after_send = false,
		track_selection = true,
		terminal = {
			split_side = "right",
			split_width_percentage = 0.35,
			provider = "auto",
			auto_close = true,
		},
	},
	keys = {
		{ "<leader>oc", "<cmd>ClaudeCode<cr>", desc = "Open Claude" },
		{ "<leader>fc", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>cc", "<cmd>ClaudeCodeClose<cr>", desc = "Close Claude" },
		{
			"<leader>sc",
			":ClaudeCodeSend<CR>",
			mode = "v",
			desc = "Send selection to Claude",
		},
		--diff
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
	},
}
