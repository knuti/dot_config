return {
  "folke/todo-comments.nvim",
  events = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    local km = vim.keymap

    km.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    km.set("n", "[t", function()
      todo_comments.jump_next()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
