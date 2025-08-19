return {
  {
    "akinsho/bufferline.nvim",
    -- dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    keys = {
      { "<leader>bs", "<Cmd>BufferLinePick<CR>", desc = "Select Buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        style_preset = 4,
        color_icons = true,
        separator_style = "slant",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
      },
    },
  },
}
