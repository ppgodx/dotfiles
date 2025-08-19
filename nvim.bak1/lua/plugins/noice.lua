return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        fps = 60,
        max_width = 60,
        max_height = 15,
        timeout = 1500,
        top_down = true,
      },
    },
  },
  event = "VeryLazy",
  opts = {
    -- add any options here
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "popup",
      view_search = "virtualtext",
    },
    commands = {
      history = { view = "popup" },
    },
  },
	-- stylua: ignore
	keys = {
		{ "<leader>n", "", desc = "+Noice" },
		{ "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message", },
		{ "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History", },
		{ "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All", },
		{ "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All", },
		{ "<leader>nt", function() require("noice").cmd("pick") end, desc = "Noice Picker", },
	},
}
