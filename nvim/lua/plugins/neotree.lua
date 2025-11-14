return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "User FilePost",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
        window = {
          position = "left",
        },
       filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    }},
      default_component_configs = {
        container = {
          enable_character_fade = true,
          modified = {
            symbol = "✚",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },

          git_status = {
            symbols = {
              -- Change type
              added = "A",
              modified = "M",
              deleted = "D",
              renamed = "R",
              -- Status type
              untracked = "U",
              ignored = "I",
              unstaged = "UNS",
              staged = "S",
              conflict = "C",
            },
          },
        },
      },
    })
  end,

  cmd = "Neotree",

  keys = {
    { "<C-t>", "<CMD>Neotree toggle<CR>", mode = { "n", "v" }, { desc = "Neotree" } },
  },
}
