return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "lua", "cpp", "markdown", "html" },
    highlight = { enable = true },
  },
}
