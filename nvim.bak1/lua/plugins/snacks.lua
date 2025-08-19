return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = {
      enabled = true,
      folds = { open = true, git_hl = true },
      refresh = 25,
    },
    indent = { enabled = true },
    scope = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          enabled = true,
          finder = "explorer",
          supports_live = false,
          follow_file = true,
          win = {
            list = {
              keys = {
                ["."] = "tcd",
                ["z"] = "explorer_close_all",
                ["P"] = false,
                ["<leader>/"] = false,
                ["<c-b>"] = false,
                ["<c-c>"] = false,
                ["<c-f>"] = false,
                ["<c-t>"] = false,
                ["<c-q>"] = false,
                ["<c-j>"] = false,
                ["<c-k>"] = false,
                ["<c-n>"] = false,
                ["<c-p>"] = false,
                ["<c-w>H"] = false,
                ["<c-w>J"] = false,
                ["<c-w>K"] = false,
                ["<c-w>L"] = false,
                ["<s-cr>"] = false,
                ["zb"] = false,
                ["zt"] = false,
                ["zz"] = false,
                ["I"] = false,
                ["H"] = false,
                ["Z"] = false,
                ["]g"] = false,
                ["[g"] = false,
                ["]d"] = false,
                ["[d"] = false,
                ["]w"] = false,
                ["[w"] = false,
                ["]e"] = false,
                ["[e"] = false,
              },
            },
          },
        },
      },
    },
    lazygit = {
      enabled = true,
      theme = {
        activeBorderColor = { fg = "@comment.warning", bold = true },
        inactiveBorderColor = { fg = "FloatTitle" },
      },
    },
    styles = {
      terminal = {
        keys = {
          term_normal = {
            "<M-n>",
            function()
              vim.cmd("stopinsert")
            end,
            mode = "t",
            expr = false,
            desc = "Escape to normal mode",
          },
        },
      },
      lazygit = {
        backdrop = 100,
      },
    },
  },
  -- stylua: ignore
	keys = {
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete current buffer", mode = { "n" }, },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers", mode = { "n" }, },
		{ "<C-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" }, },
		{ "<C-_>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" }, },
		{ "<leader>e", function() Snacks.explorer({ cwd = require("global.utils.bufdir").current_bufdir() }) end, desc = "Explorer Snacks", mode = { "n" }, },
		{ "<M-n>", function() Snacks.words.jump(vim.v.count1, true) end, desc = "Next Reference", mode = { "n" }, },
		{ "<M-p>", function() Snacks.words.jump(-vim.v.count1, true) end, desc = "Prev Reference", mode = { "n" }, },
    { "<leader>gl", function() Snacks.lazygit() end, desc = "Lazygit", mode = { "n" }, },
	},
}
