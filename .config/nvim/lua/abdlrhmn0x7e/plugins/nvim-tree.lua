return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function open_win_config_func()
        local scr_w = vim.opt.columns:get()
        local scr_h = vim.opt.lines:get()
        local tree_w = 80
        local tree_h = math.floor(tree_w * scr_h / scr_w)
        return {
          border = "double",
          relative = "editor",
          width = tree_w,
          height = tree_h,
          col = (scr_w - tree_w) / 2,
          row = (scr_h - tree_h) / 2,
        }
      end

      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvim Tree Toggle" })

      require("nvim-tree").setup({
        view = {
          signcolumn = "yes",
          float = {
            enable = true,
            open_win_config = open_win_config_func,
          },
          cursorline = false,
        },
        modified = {
          enable = true,
        },
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        renderer = {
          indent_width = 2,
          icons = {
            show = {
              hidden = true,
            },
            git_placement = "after",
            bookmarks_placement = "after",
            symlink_arrow = " -> ",
            glyphs = {
              default = "󱓻",
              symlink = "󱓻",
              bookmark = "",
              modified = "",
              hidden = "󱙝",
              git = {
                unstaged = "×",
                staged = "",
                unmerged = "󰧾",
                untracked = "",
                renamed = "",
                deleted = "",
                ignored = "∅",
              },
            },
          },
        },
        filters = {
          git_ignored = false,
        },
        hijack_cursor = true,
        sync_root_with_cwd = true,
      })

      local api = require("nvim-tree.api")
      api.events.subscribe(api.events.Event.FileCreated, function(file)
        vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
      end)
    end,
  },

  {
    "igorlfs/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua", -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
