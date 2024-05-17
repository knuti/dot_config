return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    {
      "smjonas/inc-rename.nvim",
      config = true,
    },
  },
  opts = {
    autoformat = true,
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local km = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      -- enable keybindings only if lsp server available
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        km.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

        opts.desc = "Go to declaration"
        km.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        km.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

        opts.desc = "Show LSP implementation"
        km.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

        opts.desc = "Show LSP type definitions"
        km.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)

        opts.desc = "List available code actions"
        km.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, opts)

        -- defined in none-ls.lua plugin
        -- opts.desc = "Format the current buffer"
        -- km.set("n", "gf", vim.lsp.buf.format, opts)

        opts.desc = "Smart rename"
        km.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        km.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

        opts.desc = "Show line diagnostics"
        km.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        km.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        km.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show available documentation for item under cursor"
        km.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        km.set("n", "<leader>rs", ":LspRestart<cr>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- server list is taken from mason.lua's ensure_installed block
      function(server_name)
        lspconfig[server_name].setup({
          -- on_attach = on_attach,
          capabilities = capabilities,
        })
      end,

      ["gopls"] = function()
        lspconfig["gopls"].setup({
          capabilities = capabilities,
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              standaloneTags = { "unit", "integration" },
              gofumpt = true,
              analyses = {
                unusedparamas = true,
              },
            },
          },
        })
      end,

      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
