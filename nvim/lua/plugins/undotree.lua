return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	keys = {
		{
			"<leader>ut",
			"<cmd>UndotreeToggle<CR>",
			desc = "Toggle Undotree",
		},
	},
	init = function()
		vim.g.undotree_WindowLayout = 2
		vim.g.undotree_DiffpanelHeight = 8
		-- vim.g.undotree_DiffCommand = "delta"
		local undo_dir = vim.fn.expand("~/.undodir")
		if vim.fn.isdirectory(undo_dir) == 0 then
			vim.fn.mkdir(undo_dir, "p", "0700")
		end
		vim.opt.undofile = true
		vim.opt.undodir = undo_dir
	end,
}
