return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_enable = {
				exclude = {
					"ts_ls",
				},
			},
			automatic_installation = true,
			ensure_installed = {
				"ts_ls",
				"copilot",
				"ltex",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"prismals",
				"pyright",
				"vtsls",
				"emmet_language_server",
				"emmet_ls",
				"jsonls",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			automatic_installation = true,
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				{ "eslint_d", version = "13.1.2" },
			},
		})
	end,
}
