vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Переключение буферов через []
vim.keymap.set({ "n", "v" }, "<A-[>", "<cmd>bp<CR>")
vim.keymap.set({ "n", "v" }, "<A-]>", "<cmd>bn<CR>")

-- it's over it's a game over, man. This is game over
vim.keymap.set({ "n", "v", "i" }, "<Leader><F10>", "<cmd>qall!<CR>")

-- yank my buffer up
vim.keymap.set({ "v" }, "Y", '"+y')         -- E.g: <leader>yy will yank current line to os clipboard
vim.keymap.set({ "v" }, "<C-Y>:", '"+y$')   -- E.g: <leader>yy will yank current line to os clipboard
vim.keymap.set({ "n" }, "<Leader>p", '"+p') -- Paste after cursor from clipboard
vim.keymap.set({ "n" }, "<Leader>P", '"+P') -- Paste before cursor from clipboard
-- Disable arrow keys in normal, insert, and visual modes
vim.keymap.set({ "n" }, "<Up>", "<Nop>")
vim.keymap.set({ "n" }, "<Down>", "<Nop>")
vim.keymap.set({ "n" }, "<Left>", "<Nop>")
vim.keymap.set({ "n" }, "<Right>", "<Nop>")
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>%w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc><cmd>%w<CR>")
vim.keymap.set("n", "G", "Gzz", { desc = "Center line on middle" })
vim.keymap.set("n", "j", "jzz", { noremap = true })
vim.keymap.set("n", "k", "kzz", { noremap = true })
