return {
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-treesitter/nvim-treesitter-context",

	opts = {
		ensure_installed = {
			"bash",
			"css",
			"comment",
			"gitcommit",
			"gitignore",
			"gitattributes",
			"git_config",
			"git_rebase",
			"html",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"rust",
			"ron",
			"scss",
			"sqlfluff",
			"toml",
			"vim",
			"vimdoc",
			"dockerfile",
			"yaml",
		},

		indent = { enable = true },

		injections = { enable = true }, -- ← запятая была обязательна!

		sync_install = true,
		auto_install = true,

		highlight = {
			enable = false,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
	},
}
