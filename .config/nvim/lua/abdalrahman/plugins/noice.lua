---@diagnostic disable: missing-fields
return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
			},
			cmdline = {
				view = "cmdline",
				format = {
					cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
					search_down = {
						view = "cmdline",
						icon = "󰱽",
					},
					search_up = {
						view = "cmdline",
						icon = "󰱽",
					},
				},
			},

			lsp = {
				hover = {
					enabled = true,
					view = nil,
					opts = {
						border = "rounded",
						position = { row = 2, col = 2 },
					},
				},
			},
		})
	end,
}
