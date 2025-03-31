return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "letieu/harpoon-lualine" },

	config = function()
		---@param style? string
		function GetTheme(style)
			local colors, config = require("tokyonight.colors").setup({
				style = style,
			})

			local hl = {}

			hl.normal = {
				a = { bg = colors.blue, fg = colors.black },
				b = { bg = colors.fg_gutter, fg = colors.blue },
				c = { fg = colors.fg_sidebar },
			}

			hl.insert = {
				a = { bg = colors.green, fg = colors.black },
				b = { bg = colors.fg_gutter, fg = colors.green },
			}

			hl.command = {
				a = { bg = colors.yellow, fg = colors.black },
				b = { bg = colors.fg_gutter, fg = colors.yellow },
			}

			hl.visual = {
				a = { bg = colors.magenta, fg = colors.black },
				b = { bg = colors.fg_gutter, fg = colors.magenta },
			}

			hl.replace = {
				a = { bg = colors.red, fg = colors.black },
				b = { bg = colors.fg_gutter, fg = colors.red },
			}

			hl.terminal = {
				a = { bg = colors.green1, fg = colors.black },
				b = { bg = colors.fg_gutter, fg = colors.green1 },
			}

			hl.inactive = {
				a = { bg = colors.bg_statusline, fg = colors.blue },
				b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
				c = { fg = colors.fg_gutter },
			}

			if config.lualine_bold then
				for _, mode in pairs(hl) do
					mode.a.gui = "bold"
				end
			end
			return hl
		end

		vim.o.laststatus = vim.g.lualine_laststatus
		require("lualine").setup({
			options = {
				theme = GetTheme("storm"),
				component_separators = "|",
				section_separators = { left = "", right = "" },
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "harpoon2", "fileformat", "filetype" },
				lualine_y = {},
				lualine_z = {},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "harpoon2", "location" },
				lualine_y = {},
				lualine_z = {},
			},

			extensions = {
				"nvim-tree",
			},
		})
	end,
}
