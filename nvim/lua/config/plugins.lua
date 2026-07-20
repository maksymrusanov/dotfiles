
-- ── Dependencies (shared) ───────────────────────────────────────────────
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-neotest/nvim-nio",
})

-- ── neotree ───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/nvim-neo-tree/neo-tree.nvim",
})
require("neo-tree").setup({
  window = { position = "right" },
  filesystem = {
  filtered_items = {
       hide_dotfiles = false
  },
}
})
vim.keymap.set("n", "<C-t>", "<cmd>Neotree toggle<cr>", {
  desc = "Neotree"
})

-- ── autopairs ───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/windwp/nvim-autopairs"})
require("nvim-autopairs").setup({event = "InsertEnter",
    config = true})

-- ── blink ───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/rafamadriz/friendly-snippets",
})
local cmp = require("blink.cmp")
local blink_root = vim.fn.stdpath("data")
  .. "/site/pack/core/opt/blink.cmp"
if vim.fn.isdirectory(blink_root .. "/target") == 0 then
  cmp.build():pwait()
end
cmp.setup({
  keymap = {
    preset = "enter",
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = {
      auto_show = false,
      auto_show_delay_ms = 5000,
    },
    trigger = {
      prefetch_on_insert = false,
    },
  },
  signature = {
    enabled = false,
    trigger = {
      enabled = false,
      show_on_trigger_character = false,
      show_on_insert_on_trigger_character = false,
    },
  },
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})

-- ── colorcolumn───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/lukas-reineke/virt-column.nvim"})
-- ── coloriser───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/catgoose/nvim-colorizer.lua",
})
require("colorizer").setup({
  filetypes = {
    "css",
    "config",
    "lua",
    "python",
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = true,
    AARRGGBB = true,
    rgb_fn = true,
    hsl_fn = true,
    css = false,
    css_fn = false,
    mode = "background",
    tailwind = false,
    sass = {
      enable = false,
      parsers = {
        "css",
      },
    },
    virtualtext = "■",
    always_update = false,
  },
  buftypes = {},
})

-- ── color scheme───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/bluz71/vim-moonfly-colors",
})

vim.cmd.colorscheme("moonfly")

-- Transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Cursor line
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "#1e1e1e",
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#ffffff",
  bold = true,
})
-- ── fff───────────────────────────────────────────────────────────
vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})
vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}
vim.keymap.set("n", "<leader><leader>", function()
  require("fff").find_files()
end, {
  desc = "FFFind files",
})
vim.keymap.set("n", "<C-p>", function()
  require("fff").live_grep()
end, {
  desc = "LiFFFe grep",
})

-- ── conform ───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/stevearc/conform.nvim"})
require("conform").setup({
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                css = { "prettier" },
                htmldjango = { "prettier" },
                html = { "prettier" },
                cpp = { "clang_format" },
                c = { "clang_format" },
                lua = { "stylua" },
                python = { "ruff", "black" },

                docker={"prettier"}
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 3000,
            },
        })
    end,
})

-- ── indent───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/lukas-reineke/indent-blankline.nvim",
})
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup({
  indent = {
    highlight = highlight,
  },
  scope = {
    highlight = highlight,
  },
})

-- ── lsp───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})
require("config.lsp_settings")

-- ── lualine───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})
local colors = {
  bg = "#050505",
  bg_alt = "#141414",
  fg = "#d9d9d9",
  fg_muted = "#8a8a8a",
  red = "#ff2f2f",
  red_dark = "#a50000",
  red_dim = "#5c0a0a",
}
local theme = {
  normal = {
    a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.red_dark, fg = colors.fg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  visual = {
    a = { bg = colors.red_dim, fg = colors.fg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  command = {
    a = { bg = colors.red_dark, fg = colors.fg, gui = "bold" },
    b = { bg = colors.bg_alt, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  inactive = {
    a = { bg = colors.bg, fg = colors.fg_muted, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg_muted },
    c = { bg = colors.bg, fg = colors.fg_muted },
  },
}
local function lsp()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return ""
  end
  return "LSP:" .. clients[1].name
end
require("lualine").setup({
  options = {
    theme = theme,
    component_separators = "",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      "branch",
    },
    lualine_c = {
      {
        "filename",
        path = 2,
      },
    },
    lualine_x = {
      "diagnostics",
      lsp,
    },
    lualine_y = {},
    lualine_z = {
      "location",
    },
  },
})

-- ── markdown───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
require("render-markdown").setup({})
vim.keymap.set("n", "<Leader>md", "<CMD>RenderMarkdown toggle<CR>", {
  desc = "markdown toggle preview",
})

--─ mason───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "cssls",
    "emmet_ls",
    "html",
    "dockerls",
"docker_compose_language_service",
    "rust_analyzer",
  },
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "black",
    "ruff",
  },})


--─ mini───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/echasnovski/mini.cursorword"})
require("mini.cursorword").setup()

--─ multiline───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/brenton-leighton/multiple-cursors.nvim",
})
require("multiple-cursors").setup({})
vim.keymap.set(
  { "n", "i", "x" },
  "<C-Down>",
  "<Cmd>MultipleCursorsAddDown<CR>",
  {
    desc = "Add cursor and move down",
  }
)
vim.keymap.set(
  { "n", "i", "x" },
  "<C-Up>",
  "<Cmd>MultipleCursorsAddUp<CR>",
  {
    desc = "Add cursor and move up",
  }
)

--─ rainbow───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/HiPhish/rainbow-delimiters.nvim"})
require("rainbow-delimiters.setup").setup({
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
			strategy = {
				[""] = "rainbow-delimiters.strategy.global",
			},
			query = {
				[""] = "rainbow-delimiters",
			},
		})

--─ suggestions───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/ray-x/lsp_signature.nvim"})
require("lsp_signature").setup({
  hint_enable = false,
  floating_window = true,
  max_width = 40,
  max_height = 5,
  floating_window_off_x = 5,
  floating_window_off_y = 0,
  handler_opts = {
    border = "single",
  },
})

--─ surround───────────────────────────────────────────────────────────
vim.pack.add({"https://github.com/kylechui/nvim-surround"})

--─ tiny-code-action───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/rachartier/tiny-code-action.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/ibhagwan/fzf-lua",
})
require("tiny-code-action").setup({
    vim.keymap.set(
  "n",
  "<leader>ca",
  function()
    require("tiny-code-action").code_action()
  end,
  {
    desc = "Code Action",
  }
)
})

--─ toggleterm───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
})
require("toggleterm").setup({
  direction = "float",
  start_in_insert = true,
  persist_mode = true,
  float_opts = {
    border = "rounded",
    width = function()
      return math.floor(vim.o.columns * 0.5)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.5)
    end,
  },
})
vim.keymap.set("n", "<C-q>", "<cmd>ToggleTerm<CR>", {
  desc = "Terminal",
})

--─ treesitter───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})
require("nvim-treesitter").install({
  "bash",
  "cpp",
  "c",
  "cmake",
  "dockerfile",
  "lua",
  "python",
  "html",
  "yaml",
  "json",
  "markdown",
  "markdown_inline",
  "toml",
  "rust",
})
require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  min_window_height = 1,
  line_numbers = true,
  multiline_threshold = 1,
  trim_scope = "outer",
  mode = "topline",
  separator = nil,
  zindex = 20,
})

--─ trouble───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/folke/trouble.nvim",
})
require("trouble").setup({})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", {
  desc = "Diagnostics (Trouble)",
})
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", {
  desc = "Buffer Diagnostics (Trouble)",
})
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", {
  desc = "Symbols (Trouble)",
})
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", {
  desc = "LSP Definitions / references / ... (Trouble)",
})
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", {
  desc = "Location List (Trouble)",
})
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", {
  desc = "Quickfix List (Trouble)",
})

--─ undotree───────────────────────────────────────────────────────────
vim.pack.add({
  "https://github.com/mbbill/undotree",
})
vim.g.undotree_WindowLayout = 2
vim.g.undotree_DiffpanelHeight = 8
-- vim.g.undotree_DiffCommand = "delta"
local undo_dir = vim.fn.expand("~/.undodir")
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p", "0700")
end
vim.opt.undofile = true
vim.opt.undodir = undo_dir
vim.keymap.set("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", {
  desc = "Toggle Undotree",
})

-- ── Dashboard ───────────────────────────────────────────────────────────
vim.pack.add({ "https://github.com/folke/snacks.nvim" })
require("snacks").setup({
  -- single-window UIs for vim.ui.select / vim.ui.input so dap's config picker
  -- and input prompts don't fall back to the builtin (which noice splits into
  -- two stacked popups: the message list in front, the cmdline input behind).
  input = { enabled = true },
  picker = { enabled = true, ui_select = true },
  dashboard = {
    preset = {
        header = [[

 ███╗   ██╗██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██║   ██║██║████╗ ████║
 ██╔██╗ ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

      ]],
    },
    sections = {
      { section = "header" },
      { section = "keys",         gap = 1,    padding = 1 },
      { section = "recent_files", padding = 1 },
    },
  },
})
