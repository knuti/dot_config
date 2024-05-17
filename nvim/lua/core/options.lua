local opt = vim.opt

-- Show line numbers for active one, relative marks for others
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.expandtab = true -- expands tab to spaces
-- following opts set through treesitter
-- opt.tabstop = 2 -- tabs being only two spaces long instead of 8
-- opt.shiftwidth = 2 -- 2 spaces for indent width
-- opt.autoindent = true -- copy indentation level when starting new line

opt.showmode = false

-- search settings
opt.ignorecase = true -- no SHIFT no problem
opt.smartcase = true -- got SHIFT in the mix, now goes case sensitive

opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 5

-- if using no plugged in file explorer, this setting makes
-- the default tree a bit more pleasant to use
-- vim.cmd("let g:netrw_liststyle = 3")

-- split windows
opt.splitright = true -- vertical splits go to the right
opt.splitbelow = true -- horizontal splits go below

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, eol or insert mode start position
