return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      { "nvim-telescope/telescope.nvim" },
    },
    cmd = "CopilotChat",
    help = true,
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        context = "buffers",
        model = "gpt-4.1",
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        error_header = " Error ",
        show_help = false,
        insert_at_end = false,
        -- references_display = "write",
        window = {
          width = 0.35,
        },
        mappings = {
          reset = {
            normal = "<C-x>",
            insert = "<C-x>",
          },
        },
      }
    end,
    keys = {
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle CopilotChat",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.foldcolumn = "0"
        end,
      })

      chat.setup(opts)
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
