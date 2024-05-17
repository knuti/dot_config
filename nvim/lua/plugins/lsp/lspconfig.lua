-- local u = require('utils')
--
-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     {
--       "smjonas/inc-rename.nvim",
--       config = true,
--     },
--   },
--   opts = {
--     autoformat = true,
--   },
--   config = function()
--     -- import lspconfig plugin
--     local lspconfig = require("lspconfig")
--
--     -- import cmp-nvim-lsp plugin
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
--     local keymap = vim.keymap -- for conciseness
--
--     -- enable keybinds only for when lsp server available
--     local on_attach = function(client, bufnr)
--       local opts = { noremap = true, silent = true, buffer = bufnr }
--       -- keybind options
--       keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--       keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--
--       keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--       keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--       keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
--       keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--       keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--
--       if client.supports_method("textDocument/formatting") then
--         local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
--         vim.api.nvim_create_autocmd('BufWritePre', {
--           group = format_on_save,
--           buffer = bufnr,
--           callback = function()
--             vim.lsp.buf.format({
--               bufnr = bufnr,
--               filter = function(_client)
--                 return _client.name == "null-ls"
--               end
--             })
--           end,
--         })
--       end
--     end
--
--     -- used to enable autocompletion (assign to every lsp server config)
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--
--     -- Change the Diagnostic symbols in the sign column (gutter)
--     -- (not in youtube nvim video)
--     local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
--     for type, icon in pairs(signs) do
--       local hl = "DiagnosticSign" .. type
--       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--     end
--
--     local language_server = {
--       -- "dockerls", -- DOCKER
--       -- "html",
--       -- "cssls",
--       "lua_ls",
--       -- "jsonls", -- JSON
--       "solargraph",  -- RUBY
--       -- "ruby_ls", -- RUBY
--       "sqls",        -- SQL
--       "marksman",    -- Markdown
--       "terraformls", -- Terraform
--     }
--
--     for _, server in pairs(language_server) do
--       lspconfig[server].setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--       })
--     end
--
--     lspconfig.gopls.setup({
--       on_attach = on_attach,
--       capabilities = capabilities,
--       settings = {
--         gopls = {
--           completeUnimported = true,
--           usePlaceholders = true,
--           standaloneTags = { "unit", "integration" },
--           gofumpt = true,
--           analyses = {
--             unusedparamas = true
--           }
--         }
--       }
--     })
--
--     -- configure lua server (with special settings)
--     lspconfig["lua_ls"].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = { -- custom settings for lua
--         Lua = {
--           -- make the language server recognize "vim" global
--           diagnostics = {
--             globals = { "vim" },
--           },
--           workspace = {
--             -- make language server aware of runtime files
--             library = {
--               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--               [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--           },
--         },
--       },
--     })
--   end,
-- }
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ruby_lsp",
          -- "solargraph",
          "sqls",
          "gopls",
          "marksman",
          "terraformls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.sqls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.terraformls.setup({})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    end,
  },
}
