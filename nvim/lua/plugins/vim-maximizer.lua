-- maximize a split to full screen
-- should help seeing commit line or lsp warnings that are too long
-- without closing a horizontal split before
return {
  "szw/vim-maximizer",
  keys = { -- lazy loaded only after first appearancce of defined keystrokes
    { "<leader>sm", "<cmd>MaximizerToggle<cr>", desc = "Max/Minimize selected split" }
  }
}
