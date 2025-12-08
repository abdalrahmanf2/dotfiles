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

      popup = {
        border = {
          style = "none",
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },

      cmdline_popup = {
        border = {
          style = "none",
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
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
          silent = true,
          view = nil,
          opts = {
            border = nil,
            position = { row = 2, col = 2 },
          },
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = false, -- Will open signature help when jumping to Luasnip insert nodes
            throttle = 50, -- Debounce lsp signature help request by 50ms
          },
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {}, -- merged with defaults from documentation
        },
      },
    })
  end,
}
