-- :help lspconfig-all
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      "smjonas/inc-rename.nvim",
      config = true,
    },
  },
  opts = {
    autoformat = true,
  },
  config = function()
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

        -- opts.desc = "Go to previous diagnostic"
        -- km.set("n", "[d", vim.diagnostic.goto_prev, opts)
        --
        -- opts.desc = "Go to next diagnostic"
        -- km.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show available documentation for item under cursor"
        km.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        km.set("n", "<leader>rs", ":LspRestart<cr>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    -- local capabilities = cmp_nvim_lsp.default_capabilities()
    -- Change the Diagnostic symbols in the sign column (gutter)
    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end

    vim.lsp.config("lua_ls", {
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
            -- disable = { "missing-fields" },
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
          runtime = {
            version = "LuaJIT",
          },
          hint = { enable = true },
          signatureHelp = { enable = true },
        },
      },
    })

    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          buildFlags = { "-tags=integration", "-tags=unit" },
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

    vim.lsp.config("solargraph", {
      settings = {
        solargraph = {
          diagnostics = true,
        },
      },
      filetypes = { "ruby" },
    })
  end,
}
