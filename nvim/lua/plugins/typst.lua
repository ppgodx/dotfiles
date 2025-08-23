return {
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
    config = function()
      -- Let Treesitter handle syntax highlighting
      vim.g.typst_syntax_highlight = 0
    end,
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    version = "0.3.*",
    ft = "typst",
    keys = {
      { "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Typst预览", ft = "typst" },
      { "<leader>ts", "<cmd>TypstPreviewStop<cr>", desc = "停止Typst预览", ft = "typst" },
      { "<leader>tt", "<cmd>TypstPreviewToggle<cr>", desc = "切换Typst预览", ft = "typst" },
      { "<leader>tj", "<cmd>TypstPreviewFollowCursor<cr>", desc = "跟随光标", ft = "typst" },
    },
    build = function()
      require("typst-preview").update()
    end,
    config = function()
      require("typst-preview").setup({
        -- Setting this true will show debug information
        debug = false,

        -- 使用内置浏览器预览，避免打开外部浏览器
        -- 这会在 Neovim 内部启动一个服务器，你可以通过浮动终端访问
        open_cmd = nil,
        
        -- 设置预览的浏览器命令（如果你想用特定浏览器）
        -- 例如：'firefox %s' 或 'chrome %s'
        -- 留空则使用系统默认浏览器
        
        -- 设置为 false 可以避免自动打开浏览器
        -- 手动访问 http://127.0.0.1:端口号 查看预览
        follow_cursor = true,
        
        -- This function will be called to determine the root of the typst project
        get_root = function(path_of_main_file)
          return vim.fn.fnamemodify(path_of_main_file, ":h")
        end,

        -- This function will be called to determine the main file of the typst
        -- project.
        get_main_file = function(path_of_buffer)
          return path_of_buffer
        end,

        -- Setting this true will enable printing of the program's output to
        -- neovim's command area when running commands.
        print_out = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typst_lsp = {
          settings = {
            exportPdf = "onType", -- Choose onType, onSave or never.
            serverPath = "", -- Normally, there is no need to uncomment it.
          },
        },
      },
    },
  },
}