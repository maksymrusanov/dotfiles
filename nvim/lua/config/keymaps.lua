vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
vim.opt.clipboard = "unnamedplus"
-- ✅ использовать системный буфер обмена
vim.opt.clipboard = "unnamedplus"

--Copy (Ctrl+C)
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

--Paste (Ctrl+V)
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

--Undo
vim.keymap.set('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-z>', '<C-r>', { noremap = true, silent = true })

