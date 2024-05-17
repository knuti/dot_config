return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open/close trouble list" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Open/close trouble workspace diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Open/close trouble document diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Open/close trouble quickfix list" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Open/close trouble location list" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Open todos in trouble" },
  }
}
