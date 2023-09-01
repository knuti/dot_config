-- [[ .config/nvim/ginit.lua ]]
-- main file being loaded when opening up NeoVim
-- Therefore defining settings globally applicable
-- For now

-- Set <leader> key to SPACE
-- Required by lazy package manager to do beforehand
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Show line numbers for active one, relative marks for others
vim.opt.number = true
vim.opt.relativenumber = true

-- [[ for a keymaps file ]]
local opt = vim.opt
opt.showmode = false
opt.expandtab = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.termguicolors = true

local km = vim.keymap

local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- -- Shorten function name
-- local keymap = vim.api.nvim_set_keymap

opts.desc = "clear highlights from search"
km.set('n', '<Esc>', ":noh <CR>", opts)

opts.desc = "resize in the arrows direction"
km.set("n", "<C-Up>", ":resize -2<CR>", opts)
km.set("n", "<C-Down>", ":resize +2<CR>", opts)
km.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
km.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

opts.desc = "open a new tab"
km.set("n", "<leader>t", "<cmd> tabnew <CR>", opts)

opts.desc = "close a tab"
km.set("n", "<leader>c", "<cmd> close <CR>", opts)

opts.desc = "quick save"
km.set("n", "<leader>w", "<cmd> w <CR>", opts)

opts.desc = "navigate between tabs with [SHIFT] TAB"
km.set("n", "<tab>", "<cmd> tabnext <CR>", opts)
km.set("n", "<S-tab>", "<cmd> tabprevious <CR>", opts)

-- finally, a package manager
-- github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

--local plugins = require('plugins')
--local options = {} -- require('plugin_config')
--require('lazy').setup(plugins, options)
require("lazy").setup(
  { {import = "plugins"}, {} },
	{ 
		install = {
			colorscheme = { "catppuccin" },
		}, 
		checker = {
			enabled = true,
			notify = false,
		},
		change_detection = {
			notify = false,
		},
	}
)
