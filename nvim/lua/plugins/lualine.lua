return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
     config = function()
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff0000',
  violet = '#d183e8',
  grey   = '#303030',
  green  = '#008000',  
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.white},
    b = { fg = colors.black, bg = colors.white },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.red } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme =bubbles_theme,
    section_separators = {},
  },
  sections = {
    lualine_a = { {'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_y = {'branch','filetype','progress'},
     lualine_x = {},
    lualine_z = {
      { 'location', separator = { right =''}, left_padding = 2 },
    },
  },
  tabline = {},
  extensions = {},
}   

    
    end
}   
