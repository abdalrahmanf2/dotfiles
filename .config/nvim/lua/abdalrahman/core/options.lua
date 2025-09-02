-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
local o = vim.opt

o.guicursor = ""

-- auto read files when they change
o.autoread = true

-- remove "~" sign from the end of buffers
o.fillchars = { eob = " " }

-- enable relative line numbers
o.relativenumber = true
o.number = true

-- tabs and indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.wrap = false

-- enable folding ( setup in nvim-ufo )
vim.o.foldenable = true -- Enable folding by default
vim.o.foldmethod = "manual" -- Default fold method (change as needed)
vim.o.foldlevel = 99 -- Open most folds by default
vim.o.foldcolumn = "0"

--split windows
vim.opt.splitright = true --split vertical window to the right
vim.opt.splitbelow = true --split horizontal window to the bottom

-- show sign column by default
o.signcolumn = "yes"

-- gets rid of line with white spaces
vim.g.editorconfig = true

-- undo
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- enable mouse mode
o.mouse = "a"

-- don't show the mode since it's in the status line already
o.showmode = false

-- sync OS and Neovim clipboards
vim.schedule(function()
	o.clipboard = "unnamedplus"
end)

-- enable break indent
o.breakindent = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- show which line your cursor is on
o.cursorline = true

-- minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

-- color column
o.colorcolumn = "80"
