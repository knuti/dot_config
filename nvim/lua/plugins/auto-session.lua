-- finally a solution to easyly store a session and return to last opened files
--
return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")
    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Desktop", "~/Downloads" },
    })

    local km = vim.keymap
    km.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "store session for current working dir" })
    km.set("n", "<leader>sl", "<cmd>SessionRestore<cr>", { desc = "load session for current working dir" })
  end,
}
