-- Set <leader> key to SPACE
-- Required by lazy package manager to do beforehand
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- -- Shorten function name
-- local keymap = vim.api.nvim_set_keymap

opts.desc = "clear highlights from search"
km.set("n", "<Esc>", ":noh <CR>", opts)

-- control is bad on Mac OS, rethink mapping
opts.desc = "resize with vim motions"
km.set("n", "<leader>rj", ":resize -5<CR>", opts)
km.set("n", "<leader>rl", ":resize +5<CR>", opts)
km.set("n", "<leader>rk", ":vertical resize -5<CR>", opts)
km.set("n", "<leader>rl", ":vertical resize +5<CR>", opts)

opts.desc = "open a new tab"
-- km.set("n", "<leader>t", "<cmd> tabnew <CR>", opts)
km.set("n", "<leader>to", "<cmd> tabnew <CR>", opts)
km.set("n", "<leader>tf", "<cmd> tabnew %<CR>", opts)

opts.desc = "close a tab"
-- km.set("n", "<leader>c", "<cmd> close <CR>", opts)
km.set("n", "<leader>tx", "<cmd> close <CR>", opts)

opts.desc = "navigate between tabs with [SHIFT] TAB"
km.set("n", "<tab>", "<cmd> tabnext <CR>", opts)
km.set("n", "<leader>tn", "<cmd> tabnext <CR>", opts)
km.set("n", "<S-tab>", "<cmd> tabprevious <CR>", opts)
km.set("n", "<leader>tp", "<cmd> tabprevious <CR>", opts)

opts.desc = "quick save"
km.set("n", "<leader>w", "<cmd> w <CR>", opts)

opts.desc = "simple +/- 1 on number"
km.set("n", "<leader>+", "<C-a>", opts)
km.set("n", "<leader>-", "<C-x>", opts)

opts.desc = "select next buffer"
km.set("n", "<leader>bn", "<cmd> bnext <CR>", opts)
opts.desc = "select previous buffer"
km.set("n", "<leader>bp", "<cmd> bprevious <CR>", opts)
