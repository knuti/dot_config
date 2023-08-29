return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { {'nvim-lua/plenary.nvim'} },
	config = function()
		local builtin = require('telescope.builtin')
		local km = vim.keymap

		km.set('n', '<c-p>', builtin.find_files, {})
		km.set('n', '<SPACE><SPACE>', builtin.oldfiles, {})
		km.set('n', '<SPACE>fg', builtin.live_grep, {})
		km.set('n', '<SPACE>fh', builtin.help_tags, {})
	end,
}
