return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",
  opts = {},
  keys = {
    { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },
    { "<C-Up>",   "<Cmd>MultipleCursorsAddUp<CR>",   mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
  },
}
