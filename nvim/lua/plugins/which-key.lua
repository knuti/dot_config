-- see self defined key maps if you wait to long
-- (never miss a mapped functionality again, because you type to slow)
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 --ms
  end,
  opts = {
    -- overwrites can happen here
    -- empty to use defaults
    -- but set in order to let setup() call succeed
  }
}
