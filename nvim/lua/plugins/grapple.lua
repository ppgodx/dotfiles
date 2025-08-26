return {
  {
    "cbochs/grapple.nvim",
    event = "BufRead",
    keys = function()
      local keys = {
        { "<leader>H", "<cmd>Grapple toggle<cr>", desc = "书签开关" },
        { "<leader>h", "<cmd>Grapple open_tags<cr>", desc = "书签列表" },
      }
      for i = 1, 6 do
        table.insert(keys, {
          "<leader>" .. i,
          "<cmd>Grapple select index=" .. i .. "<cr>",
          desc = "跳转书签" .. i,
        })
      end
      return keys
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = { "grapple" },
        lualine_x = { "overseer" },
      },
    },
  },
}
