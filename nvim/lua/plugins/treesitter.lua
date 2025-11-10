return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
  }

