return {
  "rmagatti/auto-session",
  -- lazy = false,
  event = "VeryLazy",
  init = function()
    vim.api.nvim_create_autocmd("SessionLoadPost", {
      callback = function()
        vim.cmd("filetype detect")
      end,
    })
  end,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    enabled = false,
    root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Root dir where sessions will be stored
    -- auto_save = false,
    -- auto_restore = true,
    -- auto_create = false,
    auto_restore_last_session = false,
    git_use_branch_name = false,
    git_auto_restore_on_branch_change = false,
    lazy_support = true,
    bypass_save_filetypes = nil,
    close_unsupported_windows = true,
    continue_restore_on_error = false,
    show_auto_restore_notif = false,
    cwd_change_handling = false,
    lsp_stop_on_restore = false,
    purge_after_minutes = 14400,
    log_level = "error",
  },
  keys = {
    { "<leader>qs", "<cmd>:SessionSave<cr>", desc = "Save Session" },
    { "<leader>ql", "<cmd>:SessionSearch<cr>", desc = "Load Session" },
    { "<leader>qr", "<cmd>:SessionRestore<cr>", desc = "Restore Session" },
  },
}
