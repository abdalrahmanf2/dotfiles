function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"marko-cerovac/material.nvim",
		config = function()
			require("material").setup({
				plugins = { -- Uncomment the plugins that you use to highlight them
					"fidget",
					"harpoon",
					"nvim-cmp",
					"nvim-web-devicons",
					"telescope",
					"trouble",
				},

				disable = {
					colored_cursor = false, -- Disable the colored cursor
					borders = false, -- Disable borders between vertically split windows
					background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
					term_colors = false, -- Prevent the theme from setting terminal colors
					eob_lines = false, -- Hide the end-of-buffer lines
				},

				high_visibility = {
					lighter = false, -- Enable higher contrast text for lighter style
					darker = false, -- Enable higher contrast text for darker style
				},

				lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

				async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

				custom_colors = nil, -- If you want to override the default colors, set this to a function

				custom_highlights = function()
					local colors = require("material.colors")
					return {
						LineNrAbove = { fg = colors.main.gray },
						LineNr = { fg = colors.editor.cursor },
						LineNrBelow = { fg = colors.main.gray },
					}
				end,
			})
		end,
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				custom_highlights = function(colors)
					return {
						Comment = { fg = colors.overlay2 },
						LineNrAbove = { fg = colors.overlay1 },
						LineNr = { fg = colors.red },
						LineNrBelow = { fg = colors.overlay1 },
					}
				end,
				integrations = {
					cmp = true,
					treesitter = true,
					native_lsp = {
						enabled = true,
						styles = {
							errors = "italic",
							hints = "italic",
							warnings = "italic",
							information = "italic",
						},
					},
					lsp_trouble = false,
					lsp_saga = true,
					telescope = true,
				},
			})
		end,
	},
	{
		"water-sucks/darkrose.nvim",
		config = function()
			require("darkrose").setup({})
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
					terminal_colors = true,
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
				plugins = {
					auto = true,
				},
			})
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "pine",
				disable_background = true,
				enable = {
					terminal = true,
					legacy_highlights = true,
				},
				styles = {
					transparency = true,
					italic = false,
				},
			})

			vim.cmd("colorscheme rose-pine")

			ColorMyPencils()
		end,
	},
}
