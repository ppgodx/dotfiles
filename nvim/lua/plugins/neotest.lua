return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio", "mrcjkb/rustaceanvim" },
    lazy = true,
    config = function()
      local opts = {
        adapters = {
          require("rustaceanvim.neotest"),
        },
        quickfix = {
          enabled = false,
        },
        status = { virtual_text = true },
        output = {
          enabled = true,
          open_on_run = true,
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 15",
        },
        consumers = {
          overseer = require("neotest.consumers.overseer"),
        },
      }
      require("neotest").setup(opts)
    end,
    -- stylua: ignore
    keys = {
      {"<leader>t", "", desc = "测试相关"},
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "运行当前文件测试" },
      { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "运行所有测试" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "运行当前测试" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "重运上次测试" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "切换测试总览" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "查看测试输出" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "切换输出面板" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "停止测试" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "切换监视模式" },
    },
  },
}
