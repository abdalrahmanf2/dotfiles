require("abdalrahman.core.options")
require("abdalrahman.core.keymaps")
require("abdalrahman.core.transparency")
require("abdalrahman.lazy")

-- arabic support
vim.cmd([[ set termbidi ]])
vim.cmd([[ set guifont=Noto\ Sans\ Arabic\ UI ]])

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
