---@type vim.lsp.Config
return {
  cmd = { "/Users/max/.local/share/nvim/mason/bin/lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        globals = { "vim" },
        disable = { "missing-fields" }, -- убирает лишний шум
      },

      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config"),
        },
        checkThirdParty = false,
      },

      completion = {
        callSnippet = "Replace", -- лучшее поведение автокомплита
      },

      hint = {
        enable = true, -- inline hints (как в VSCode)
      },

      telemetry = {
        enable = false,
      },
    },
  },
}
