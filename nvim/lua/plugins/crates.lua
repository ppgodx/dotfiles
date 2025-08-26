return {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    completion = {
      crates = {
        enabled = true,
      },
      -- 明确禁用blink.cmp集成
      blink = {
        enabled = false,
      },
    },
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
  },
}
