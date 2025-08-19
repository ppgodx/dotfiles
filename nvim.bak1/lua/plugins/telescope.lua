return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "echasnovski/mini.icons", opts = {} },
  },
  cmd = "Telescope",
  opts = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    local move_12_prev = function(prompt_bufnr)
      for _ = 1, 12 do
        actions.move_selection_previous(prompt_bufnr)
      end
    end

    local move_12_next = function(prompt_bufnr)
      for _ = 1, 12 do
        actions.move_selection_next(prompt_bufnr)
      end
    end

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["<M-k>"] = move_12_prev,
            ["<M-j>"] = move_12_next,
            ["q"] = actions.close,
          },
        },
      },
      extensions = {
        ["ui-select"] = require("telescope.themes").get_dropdown({}),
      },
    })
    telescope.load_extension("ui-select")
  end,
  keys = {
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    { "<leader>st", "<cmd>Telescope<cr>", desc = "Open Telescope" },
    {
      "<leader>sc",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Nvim Configs",
    },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_document_symbols({})
      end,
      desc = "Document Symbols",
    },
  },
}
