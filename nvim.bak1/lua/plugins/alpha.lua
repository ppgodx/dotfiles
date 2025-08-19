return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = require("global.ui.ascii_arts").Tokamak.original
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find Things", "<cmd>Telescope<cr>"),
      dashboard.button("r", " " .. " Recent Files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("s", " " .. " Restore Session", "<cmd>SessionSearch<cr>"),
      dashboard.button("c", " " .. " Config", function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end),
      dashboard.button("l", " " .. " Lazy", "<cmd>Lazy<cr>"),
      dashboard.button("q", " " .. " Quit", "<cmd>qa<cr>"),
    }
    vim.cmd([[ highlight AlphaLogo guifg=#30D7FF ]])
    vim.cmd([[ highlight AlphaText guifg=#1FB7E0 ]])
    dashboard.section.header.opts.hl = "AlphaLogo"
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaText"
      button.opts.hl_shortcut = "AlphaText"
    end
    dashboard.section.footer.opts.hl = "AlphaText"
    dashboard.opts.layout[1].val = 5
    table.insert(dashboard.opts.layout, 5, { type = "padding", val = 2 })

    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "  Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        local glitch = require("global.ui.animation").glitch()
        vim.g.alphatimer = vim.fn.timer_start(32, function()
          local curpos = vim.api.nvim_win_get_cursor(0)
          local logo = glitch()
          dashboard.section.header.val = vim.split(logo, "\n")
          pcall(vim.cmd.AlphaRedraw)
          vim.api.nvim_win_set_cursor(0, curpos)
        end, { ["repeat"] = -1 })
      end,
    })
  end,
}
