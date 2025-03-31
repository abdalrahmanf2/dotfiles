return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local tokyonight = require("tokyonight")

		tokyonight.setup({
			style = "storm",
			transparent = true,
			plugins = {
				auto = true,
			},
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		vim.cmd([[colorscheme tokyonight]])
	end,
}
