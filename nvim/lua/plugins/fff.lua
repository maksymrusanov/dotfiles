return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	-- for nixos:
	-- build = "nix run .#release",
	opts = {
		layout = {
			height = 0.8,
			width = 0.8,
			prompt_position = "top",
			preview_position = "right",
			preview_size = 0.6,
		},
		debug = {
			enabled = true,
			show_scores = true,
		},
	},
	lazy = false, -- the plugin lazy-initialises itself
	keys = {
		{
			"<leader><leader>",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"<C-p>",
			function()
				require("fff").live_grep()
			end,
			desc = "LiFFFe grep",
		},
	},
}
