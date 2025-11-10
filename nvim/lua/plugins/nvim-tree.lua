return
{
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
      vim.keymap.set("n", "<C-t>",":NvimTreeToggle",{})
    require("nvim-tree").setup({
    view = {
    width = 25,}})
  end,
}




