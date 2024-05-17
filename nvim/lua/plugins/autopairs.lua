return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true, -- treesitter
      ts_config = {
        lua = { "string" }, -- avoid pairs in lua strings inside treesitter nodes
      }
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    -- make the two work together
    cmp.event:on("confirm_dome", cmp_autopairs.on_confirm_done())
  end,
}
