return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,

        window = {
          border = "rounded",

          -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          async = true,
        },
      },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  opts_extend = { "sources.default" },

  enabled = function()
    return not vim.tbl_contains({ "NvimTree", "markdown", "DressingInput" }, vim.bo.filetype)
  end,
}
