local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
})

require("config.options")
require("lazy").setup("plugins")
require("lazy").setup('lsp')
require("config.keymaps")
vim.opt.swapfile = true 
local state_dir = vim.fn.stdpath('state')
vim.opt.directory = state_dir .. '/swap//'
vim.opt.backupdir = state_dir .. '/backup//'
vim.opt.undodir = state_dir .. '/undo//'

