return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		nvimtree.setup({
			view = {
				side = "right",
			},
			renderer = {
				full_name = false,
				indent_markers = {
					enable = false,
				},
				root_folder_label = ":t",
				icons = {
					show = {
						folder_arrow = false,
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
		})

		-- snacks lsp rename integration ( updates the files path in project )
		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		vim.api.nvim_create_autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})

		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
	end,
}
