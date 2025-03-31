-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font support
vim.g.have_nerd_font = false

-- options
local o = vim.opt

-- remove "~" sign from the end of buffers
o.fillchars = { eob = " " }

-- enable relative line numbers
o.relativenumber = true

-- tabs and indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.wrap = true

-- show sign column by default
o.signcolumn = "yes"

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
