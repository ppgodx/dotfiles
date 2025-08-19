return {
  "stevearc/conform.nvim",
  event = "BufReadPost",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format Code",
    },
  },
}
