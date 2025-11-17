return {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
      startVisible = true,
    },
    keys = {
      {
        "<leader>p",
        function ()
         require("precognition").toggle()
        end,
        desc = "precognition",
      },
    },


  }
