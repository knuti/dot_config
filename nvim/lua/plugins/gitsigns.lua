return {
  "lewis6991/gitsigns.nvim", -- wrapper for git commandes
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      signcolumn = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- eol, right_align, overlay
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    })
  end
}
