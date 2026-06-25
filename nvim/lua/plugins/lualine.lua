return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
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
				lualine_a = { "mode" },
				lualine_b = { "branch" },

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
				lualine_z = { "location" },
			},
		})
	end,
}
