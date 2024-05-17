return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- ensures loading before everything else
		config = function()
			vim.cmd("colorscheme catppuccin")
			vim.o.termguicolors = true

			local catp = require("catppuccin")

			catp.setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					nvimtree = true,
					treesitter = true,
				}
			})
		end,
	},
}
