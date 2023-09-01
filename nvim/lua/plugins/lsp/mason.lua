return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason plugin safely
    require("mason").setup()

    -- import mason-lspconfig plugin safely
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
				-- "dockerls", -- DOCKER
        -- "html",
        -- "cssls",
        "lua_ls",
				-- "jsonls", -- JSON
				-- "solargraph", -- RUBY
				-- "ruby_ls", -- RUBY
				"sqls", -- SQL
				"gopls", -- GO
				"marksman", -- Markdown
				"terraformls", -- Terraform
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
  end,
}
