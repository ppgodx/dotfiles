return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      -- VimTeX configuration
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_sioyek_exe = "sioyek"
      vim.g.vimtex_view_sioyek_options = "--reuse-window"
      
      -- Compiler settings
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      
      -- Disable overfull/underfull \hbox and all package warnings
      vim.g.vimtex_log_ignore = {
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }
      
      -- Error reporting
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 3
      
      -- Disable some features for performance
      vim.g.vimtex_indent_enabled = 1
      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      
      -- Folding
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_fold_manual = 1
      
      -- Syntax - Let Treesitter handle highlighting
      vim.g.vimtex_syntax_enabled = 0
      vim.g.vimtex_syntax_conceal_disable = 1
      
      -- Mappings
      vim.g.vimtex_mappings_enabled = 1
      vim.g.vimtex_mappings_prefix = "<localleader>l"
      
      -- Disable default key mappings that might conflict
      vim.g.vimtex_mappings_disable = {
        ["n"] = { "K" }, -- Don't override K for hover
      }
    end,
    ft = { "tex", "bib" },
    keys = {
      { "<localleader>ll", "<cmd>VimtexCompile<cr>", desc = "编译LaTeX", ft = "tex" },
      { "<localleader>lv", "<cmd>VimtexView<cr>", desc = "查看PDF", ft = "tex" },
      { "<localleader>ls", "<cmd>VimtexStop<cr>", desc = "停止编译", ft = "tex" },
      { "<localleader>lc", "<cmd>VimtexClean<cr>", desc = "清理辅助文件", ft = "tex" },
      { "<localleader>le", "<cmd>VimtexErrors<cr>", desc = "查看错误", ft = "tex" },
      { "<localleader>lt", "<cmd>VimtexTocToggle<cr>", desc = "切换目录", ft = "tex" },
      { "<localleader>lm", "<cmd>VimtexImapsList<cr>", desc = "数学符号列表", ft = "tex" },
    },
  },
  {
    "frabjous/knap",
    ft = { "tex", "markdown", "rst", "typst" },
    keys = {
      { "<F5>", "<cmd>lua require('knap').process_once()<cr>", desc = "预览一次", ft = { "tex", "markdown", "rst", "typst" } },
      { "<F6>", "<cmd>lua require('knap').close_viewer()<cr>", desc = "关闭预览", ft = { "tex", "markdown", "rst", "typst" } },
      { "<F7>", "<cmd>lua require('knap').toggle_autopreviewing()<cr>", desc = "切换自动预览", ft = { "tex", "markdown", "rst", "typst" } },
      { "<F8>", "<cmd>lua require('knap').forward_jump()<cr>", desc = "正向跳转", ft = { "tex", "markdown", "rst", "typst" } },
    },
    config = function()
      local knap = require("knap")
      
      -- Set viewer to sioyek for LaTeX and Typst
      vim.g.knap_settings = {
        htmltohtmlviewerlaunch = "firefox %outputfile%",
        htmltohtmlviewerrefresh = "none",
        
        -- LaTeX settings
        texoutputext = "pdf",
        textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
        textopdfviewerlaunch = "sioyek --reuse-window %outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump = "sioyek --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
        
        -- Markdown settings
        markdownoutputext = "html",
        markdowntohtml = "pandoc --standalone %docroot% -o %outputfile%",
        markdowntohtmlviewerlaunch = "firefox %outputfile%",
        markdowntohtmlviewerrefresh = "none",
        
        -- Typst settings
        typstoutputext = "pdf",  
        typstopdf = "typst compile %docroot% %outputfile%",
        typstopdfviewerlaunch = "sioyek --reuse-window %outputfile%",
        typstopdfviewerrefresh = "none",
        typstopdfforwardjump = "sioyek --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
        
        -- Auto preview delay
        delay = 250,
      }
    end,
  },
}