local function copilot_status()
  local icons = {
    InProgress = { icon = "", color = { fg = Snacks.util.color("DiagnosticWarn") } },
    Warning = { icon = "", color = { fg = Snacks.util.color("DiagnosticError") } },
    Active = { icon = "", color = { fg = Snacks.util.color("Special") } },
    Inactive = { icon = "", color = { fg = "#602020" } },
  }
  local clients = package.loaded["copilot"] and vim.lsp.get_clients({ name = "copilot" }) or {}
  if #clients > 0 then
    local status = require("copilot.api").status.data.status
    return icons[status] or icons.Active
  else
    return icons.Inactive
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = "BufEnter",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "\\", right = "/" },
        -- component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "alpha" },
          winbar = {},
        },
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 50,
          events = {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged",
          },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icon = "" },
          "diff",
          "diagnostics",
        },
        lualine_c = { "filename" },
        lualine_x = {
          Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return " " .. copilot_status().icon .. " " end,
            cond = function() return true end,
            color = function() return copilot_status().color end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
					{ function() return require("noice").api.status.mode.get() end,
						cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
						color = function() return { fg = Snacks.util.color("Constant") } end,
					},
        },
        lualine_y = { "progress", "location" },
        lualine_z = {
          function()
            return " " .. os.date("%H:%M")
          end,
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
