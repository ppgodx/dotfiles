return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- 明确禁用LazyVim默认的blink.cmp配置
  {
    "saghen/blink.cmp",
    enabled = false,
  },
}
