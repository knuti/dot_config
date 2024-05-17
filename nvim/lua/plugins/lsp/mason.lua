return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason plugin safely
    require("mason").setup()

    -- import mason-lspconfig plugin safely
    local mason_lspconfig = require("mason-lspconfig")

    -- list of servers for mason to install
    mason_lspconfig.setup({
      ensure_installed = {
        -- "dockerls", -- DOCKER
        -- "html",
        -- "cssls",
        "lua_ls",
        -- "jsonls", -- JSON
        "solargraph", -- RUBY
        -- "ruby_ls", -- RUBY
        "sqls", -- SQL
        "gopls", -- GO
        "marksman", -- Markdown
        "terraformls", -- Terraform
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    local tool_installer = require("mason-tool-installer")
    tool_installer.setup({
      -- formatters and linter
      ensure_installed = {
        "prettier",
        "stylua",
        "rubocop",
        "golines",
        "gofumpt",
        "goimports-reviser",
        "golangci-lint",
        "markdownlint",
      },
    })
  end,
}
