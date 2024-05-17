-- [[ .config/nvim/init.lua ]]
-- main file being loaded when opening up NeoVim
-- Therefore defining settings globally applicable
-- For now

require("core")

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
  { {import = "plugins"}, {import = "plugins.lsp"} },
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
