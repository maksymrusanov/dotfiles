-- ─────────────────────────────────────────────
-- Keymaps
-- ─────────────────────────────────────────────
local map = vim.keymap.set

-- ─────────────────────────────────────────────
-- Formatting
-- ─────────────────────────────────────────────
map("n", "=ap", "ma=ap'a", {
	desc = "Format paragraph",
})

-- ─────────────────────────────────────────────
-- Save + format
-- ─────────────────────────────────────────────
map({ "n", "v", "i" }, "<C-s>", function()
	vim.cmd("write")
	require("conform").format({
		async = true,
		lsp_fallback = true,
	})
end, {
	desc = "Save and format",
})

-- ─────────────────────────────────────────────
-- Search
-- ─────────────────────────────────────────────
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- center cursor
map("n", "G", "Gzz")
map("n", "gg", "ggzz")
map("n", "<C-u>", "<C-u>zz", {
	desc = "Half page up",
})
map("n", "<C-d>", "<C-d>zz", {
	desc = "Half page down",
})

-- ─────────────────────────────────────────────
-- Window navigation
-- ─────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- ─────────────────────────────────────────────
-- Clipboard
-- ─────────────────────────────────────────────
map("n", "Y", '"+yy', {
	desc = "Copy line",
})
map("v", "Y", '"+y', {
	desc = "Copy selection",
})

-- ─────────────────────────────────────────────
-- Disable arrows
-- ─────────────────────────────────────────────
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")

-- ─────────────────────────────────────────────
-- Disable Ex mode
-- ─────────────────────────────────────────────
map("n", "Q", "<Nop>")

-- ─────────────────────────────────────────────
-- Search replace word
-- ─────────────────────────────────────────────
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "Replace word under cursor",
})

-- ─────────────────────────────────────────────
-- Select all
-- ─────────────────────────────────────────────
map("n", "<leader>a", "ggVG", {
	desc = "Select entire buffer",
})

-- ─────────────────────────────────────────────
-- Delete without yank
-- ─────────────────────────────────────────────
map({ "n", "v" }, "<leader>d", [["_d]], {
	desc = "Delete without yank",
})

-- ─────────────────────────────────────────────
-- Insert escape
-- ─────────────────────────────────────────────
map("i", "jk", "<Esc>", {
	desc = "Exit insert mode",
})

-- ─────────────────────────────────────────────
-- LSP
-- ─────────────────────────────────────────────
map("n", "<leader>gd", vim.lsp.buf.definition, {
	desc = "Go to definition",
})
map("n", "<leader>gr", vim.lsp.buf.references, {
	desc = "References",
})
map("n", "<leader>rn", vim.lsp.buf.rename, {
	desc = "Rename symbol",
})
map("n", "<leader>ca", vim.lsp.buf.code_action, {
	desc = "Code action",
})
map("n", "<leader>fs", vim.lsp.buf.document_symbol, {
	desc = "Find document symbols",
})

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, {
	desc = "Show diagnostic",
})
map("n", "[d", vim.diagnostic.goto_prev, {
	desc = "Previous diagnostic",
})
map("n", "]d", vim.diagnostic.goto_next, {
	desc = "Next diagnostic",
})

-- ─────────────────────────────────────────────
-- Plugins
-- ─────────────────────────────────────────────
map("n", "<C-t>", "<cmd>Neotree toggle<CR>", {
	desc = "Toggle Neo-tree",
})
map("n", "<leader><leader>", function()
	require("fff").find_files()
end, {
	desc = "Find files",
})
map("n", "<C-p>", function()
	require("fff").live_grep()
end, {
	desc = "Live grep",
})
map("n", "<C-q>", "<cmd>ToggleTerm<CR>", {
	desc = "Terminal",
})
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {
	desc = "Diagnostics",
})
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", {
	desc = "Undo tree",
})

-- ─────────────────────────────────────────────
-- Terminal mode
-- ─────────────────────────────────────────────
map("t", "<Esc>", [[<C-\><C-n>]], {
	desc = "Exit terminal mode",
})

-- ─────────────────────────────────────────────
-- Cleanup
-- ─────────────────────────────────────────────
map("n", "<leader>cw", function()
	vim.cmd([[g/^\s*$/d]])
end, {
	desc = "Remove empty lines",
})
