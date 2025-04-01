return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		local autocmd = vim.api.nvim_create_autocmd
		local createGroup = vim.api.nvim_create_augroup
		local lspconfig = require("lspconfig")
		local blink = require("blink.cmp")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"html",
				"cssls",
				"ts_ls",
				"emmet_ls",
				"eslint",
				"prismals",
				"tailwindcss",
				"lua_ls",
				"pyright",
			},
			handlers = {
				function(serverName)
					local blinkCapabilities = blink.get_lsp_capabilities(capabilities)
					lspconfig[serverName].setup({
						capabilities = blinkCapabilities,
					})
				end,

				["lua_ls"] = function()
					local blinkCapabilities = blink.get_lsp_capabilities(capabilities)
					lspconfig.lua_ls.setup({
						capabilities = blinkCapabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "capabilities" },
								},
							},
						},
					})
				end,

				["emmet_language_server"] = function()
					lspconfig.emmet_language_server.setup({
						filetypes = {
							"css",
							"eruby",
							"html",
							"javascript",
							"javascriptreact",
							"less",
							"sass",
							"scss",
							"pug",
							"typescriptreact",
						},
						-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
						-- **Note:** only the options listed in the table are supported.
						init_options = {
							---@type table<string, string>
							includeLanguages = {},
							--- @type string[]
							excludeLanguages = {},
							--- @type string[]
							extensionsPath = {},
							--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
							preferences = {},
							--- @type boolean Defaults to `true`
							showAbbreviationSuggestions = true,
							--- @type "always" | "never" Defaults to `"always"`
							showExpandedAbbreviation = "always",
							--- @type boolean Defaults to `false`
							showSuggestionsAsSnippets = false,
							--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
							syntaxProfiles = {},
							--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
							variables = {},
						},
					})
				end,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"eslint_d",
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			float = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✘",
					[vim.diagnostic.severity.WARN] = "▲",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
		})

		autocmd("LspAttach", {
			group = createGroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- diagnostic messages
				map("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
				map("[d", vim.diagnostic.goto_prev, "Go to prev diagnostic message")

				-- hover
				map("K", vim.lsp.buf.hover, "Hover Docs")

				-- open full diagnostic in a float
				map("<leader>d", vim.diagnostic.open_float, "Open diagnostic message in a float")

				-- rename the variable under your cursor.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- execute a code action
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				-- WARN: this is not Goto Definition, this is Goto Declaration.
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- format
				map("<c-f>", vim.lsp.buf.format, "Format buffer")
			end,
		})

		---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
		local progress = vim.defaulttable()

		autocmd("LspProgress", {
			---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
				if not client or type(value) ~= "table" then
					return
				end
				local p = progress[client.id]

				for i = 1, #p + 1 do
					if i == #p + 1 or p[i].token == ev.data.params.token then
						p[i] = {
							token = ev.data.params.token,
							msg = ("[%3d%%] %s%s"):format(
								value.kind == "end" and 100 or value.percentage or 100,
								value.title or "",
								value.message and (" **%s**"):format(value.message) or ""
							),
							done = value.kind == "end",
						}
						break
					end
				end

				local msg = {} ---@type string[]
				progress[client.id] = vim.tbl_filter(function(v)
					return table.insert(msg, v.msg) or not v.done
				end, p)

				local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
				vim.notify(table.concat(msg, "\n"), "info", {
					id = "lsp_progress",
					title = client.name,
					opts = function(notif)
						notif.icon = #progress[client.id] == 0 and " "
							or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
					end,
				})
			end,
		})
	end,
}
