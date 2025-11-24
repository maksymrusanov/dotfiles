return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- загружаем при старте
    priority = 1000, -- загружаем первым
    config = function()
      require('github-theme').setup({})
      vim.cmd('colorscheme github_dark_default')
    end,
  },
}

