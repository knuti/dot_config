return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      -- local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          path_display = { "smart" },
        },
      })
      --     mappings = {
      --       i = {
      --         ["<C-k>"] = actions.move_selection_previous, --move to previous result
      --         ["<C-j>"] = actions.move_selection_next, --move to next result
      --         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --open result list in quick-fix-menu
      --       },
      --     },
      --   },
      -- })

      telescope.load_extension("fzf")

      -- local builtin = require("telescope.builtin")
      --
      -- km.set("n", "<c-p>", builtin.find_files, {})
      -- km.set("n", "<SPACE><SPACE>", builtin.oldfiles, { desc = "oldfiles?!" })
      -- km.set("n", "<SPACE>fg", builtin.live_grep, { desc = "grep files as you type" })
      -- km.set("n", "<SPACE>fh", builtin.help_tags, { desc = "help_tags?!" })

      local km = vim.keymap
      km.set("n", "<c-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy finding of files" })
      km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy finding of files" })
      km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy finding of most recent files" })
      km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in current working Dir" })
      km.set("n", "<leader>fc", "<cmd>Telescope greo_string<cr>", { desc = "Find string under cursor in cwd" })
      km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "help_tags?!" })
      km.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
