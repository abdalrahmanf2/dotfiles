local opt = vim.opt

-- set the cursor to a square in insert mode
opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search settings
opt.hlsearch = false
opt.incsearch = true

-- colors stuff
opt.termguicolors = true

-- scrolling bahavior
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.colorcolumn = "80"

opt.updatetime = 50
