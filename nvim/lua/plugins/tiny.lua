return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "classic",
        virt_texts = {
          priority = 2048,
        },
        -- transparent_bg = true,
        multilines = {
          enabled = true,
        },
        options = {
          use_icons_from_diagnostic = true,
        },
      })
    end,
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function()
      require("tiny-code-action").setup({
        telescope_opts = {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.5,
            height = 0.5,
            preview_cutoff = 1,
            preview_height = function(_, _, max_lines)
              local h = math.floor(max_lines * 0.5)
              return math.max(h, 10)
            end,
          },
        },
      })
    end,
  },
}
