vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Formatting
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Format paragraph" })

-- Search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Navigation
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Save
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<Esc><cmd>w<CR>", {
	desc = "Save file",
})

-- Clipboard
vim.keymap.set("n", "Y", '"+yy', {
	desc = "Copy line to system clipboard",
})
vim.keymap.set("v", "Y", '"+y', {
	desc = "Copy selection to system clipboard",
})

-- Disable arrow keys
vim.keymap.set({ "n" }, "<Up>", "<Nop>")
vim.keymap.set({ "n" }, "<Down>", "<Nop>")
vim.keymap.set({ "n" }, "<Left>", "<Nop>")
vim.keymap.set({ "n" }, "<Right>", "<Nop>")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<Nop>")

-- Search & replace word under cursor
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)

-- Select entire buffer
vim.keymap.set("n", "<leader>a", "ggVG", {
	desc = "Select entire buffer",
})

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {
	desc = "Delete without copying",
})

-- Escape
vim.keymap.set("i", "jk", "<Esc>", {
	desc = "Exit insert mode",
})

vim.keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", {
	desc = "Find document symbols",
})
-- Cleanup
vim.keymap.set("n", "<leader>cw", function()
	vim.cmd([[g/^\s*$/d]])
end, {
	desc = "Remove empty lines",
})
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {
	desc = "Exit terminal mode",
})
