return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("tokyonight-night")
  end,
  opts = {
    on_highlights = function(hl, c)
      -- telescope
      hl.TelescopeNormal = { bg = c.bg }
      hl.TelescopeBorder = { fg = c.border }
      hl.TelescopeTitle = { fg = c.border_highlight }
      hl.TelescopePromptBorder = { fg = c.border_highlight }
      hl.TelescopePromptTitle = { fg = c.border_highlight }

      -- blink-cmp
      hl.BlinkCmpMenu = { bg = c.bg }
      hl.BlinkCmpMenuBorder = { fg = c.border }
      hl.BlinkCmpDoc = { bg = c.bg }
      hl.BlinkCmpDocBorder = { fg = c.border }

      -- which-key
      hl.WhichKeyNormal = { bg = c.bg }
      hl.WhichkeyBorder = { fg = c.border }
      hl.WhichKeyTitle = { fg = c.border_highlight }

      -- noice
      hl.NoicePopup = { bg = c.bg }
      hl.NoicePopupBorder = { fg = c.border }

      -- snacks
      -- hl.SnacksNormal = { bg = c.bg }
      hl.SnacksPickerInputBorder = { fg = c.border_highlight }
      hl.SnacksPickerInputTitle = { fg = c.border_highlight, bg = c.bg }
      hl.SnacksPickerBoxTitle = { fg = c.border_highlight, bg = c.bg }
      hl.SnacksPickerInputFooter = { fg = c.border_highlight, bg = c.bg }

      -- trouble
      hl.TroubleNormal = { bg = c.bg }

      -- global
      hl.Normal = { bg = c.bg }
      hl.NormalFloat = { bg = c.bg }
      hl.NormalNC = { bg = c.bg }
      hl.NormalSB = { bg = c.bg }
      hl.FloatBorder = { fg = c.border }
      hl.FloatTitle = { fg = c.border_highlight }
    end,
  },
}
