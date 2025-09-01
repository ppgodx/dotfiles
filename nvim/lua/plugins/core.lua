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
  -- 禁用LazyVim默认的LSP快捷键映射
  {
    "neovim/nvim-lspconfig", 
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- 清除所有默认的<leader>l*快捷键
      Keys = vim.tbl_filter(function(key)
        return not string.match(key[1] or "", "^<leader>l[a-z]")
      end, Keys)
      return { keys = Keys }
    end,
  },
}
