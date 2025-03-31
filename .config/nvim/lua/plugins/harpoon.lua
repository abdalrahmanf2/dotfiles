return {
	"ThePrimeagen/harpoon",
	lazy = false,
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local map = vim.keymap.set
		local harpoon = require("harpoon")

		map("n", "<leader>a", function()
			harpoon:list():add()
		end)

		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		map("n", "<C-a>", function()
			harpoon:list():select(1)
		end)
		map("n", "<C-s>", function()
			harpoon:list():select(2)
		end)
		map("n", "<C-q>", function()
			harpoon:list():select(3)
		end)
		map("n", "<C-w>", function()
			harpoon:list():select(4)
		end)
	end,
}
