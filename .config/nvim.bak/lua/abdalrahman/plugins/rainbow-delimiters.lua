return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({
			blacklist = { "html", "tsx", "jsx" },
		})
	end,
	event = "VeryLazy",
}
