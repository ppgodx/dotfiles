return {
  "mason-org/mason.nvim",
  event = "VeryLazy",
  opts = {
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.8,
      backdrop = 100,
    },
  },
  keys = {
    {
      "<leader>tm",
      "<cmd>Mason<cr>",
      desc = "Mason",
    },
  },
}
