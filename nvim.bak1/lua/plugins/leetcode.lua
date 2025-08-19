return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Leet",
  opts = {
    -- configuration goes here
    cn = { -- leetcode.cn
      enabled = true, ---@type boolean
    },
    picker = { provider = "snacks-picker" },
    editor = {
      fold_imports = false,
    },
    injector = {
      ["cpp"] = {
        imports = function()
          -- return a different list to omit default imports
          return { "#include <bits/stdc++.h>", "using namespace std;" }
        end,
        after = "int main() {}",
      },
    },
    plugins = {
      non_standalone = true,
    },
  },
}
