return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		document_color = {
			enabled = true, -- can be toggled by commands
			kind = "inline", -- "inline" | "foreground" | "background"
			inline_symbol = "󰏘 ", -- only used in inline mode
			debounce = 200, -- in milliseconds, only applied in insert mode
		},
	},
}
