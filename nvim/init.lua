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
