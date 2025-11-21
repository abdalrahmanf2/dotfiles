return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local tokyonight = require("tokyonight")

			tokyonight.setup({
				style = "night",
				transparent = true,
				plugins = {
					auto = true,
				},
				styles = {
					-- sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local gruvbox = require("gruvbox")

			gruvbox.setup({
				transparent_mode = true,
			})

			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true, -- Disable setting bg (make neovim's background transparent)
				},
			})

			-- vim.cmd("colorscheme github_dark")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			-- vim.cmd("colorscheme rose-pine")
			require("rose-pine").setup({
				variant = "main",
				enable = {
					terminal = true,
				},
				styles = {
					transparency = true,
				},
			})
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				float = {
					transparent = true, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
			})
		end,
	},

	-- {
	-- "rebelot/kanagawa.nvim",
	-- config = function()
	-- require("kanagawa").setup({
	-- transparent = true,

	-- overrides = function(colors)
	-- 	local theme = colors.theme
	-- 	return {
	-- 		NormalFloat = { bg = "none" },
	-- 		FloatBorder = { bg = "none" },
	-- 		FloatTitle = { bg = "none" },
	--
	-- 		-- Save an hlgroup with dark background and dimmed foreground
	-- 		-- so that you can use it where your still want darker windows.
	-- 		-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
	-- 		NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
	--
	-- 		-- Popular plugins that open floats will link to NormalFloat by default;
	-- 		-- set their background accordingly if you wish to keep them dark and borderless
	-- 		LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	-- 		MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	--
	-- 		Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
	-- 		PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
	-- 		PmenuSbar = { bg = theme.ui.bg_m1 },
	-- 		PmenuThumb = { bg = theme.ui.bg_p2 },
	-- 	}
	-- end,
	-- colors = {
	-- 	theme = {
	-- 		all = {
	-- 			ui = {
	-- 				bg_gutter = "none",
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- })

	-- vim.cmd("colorscheme kanagawa")
	-- end,
	-- },
}
