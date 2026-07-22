-- ─────────────────────────────────────────────
-- Options
-- ─────────────────────────────────────────────

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

-- undo
local undo_dir = vim.fn.expand("~/.undodir")

if vim.fn.isdirectory(undo_dir) == 0 then
    vim.fn.mkdir(undo_dir, "p", "0700")
end

vim.opt.undofile = true
vim.opt.undodir = undo_dir

-- Mason binaries
vim.env.PATH =
    vim.fn.stdpath("data")
    .. "/mason/bin:"
    .. vim.env.PATH
