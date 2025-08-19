local reference_definitions = {
  enable = true,

  default = {
    icon = " ",
    hl = "MarkviewPalette6Fg",
  },

  ["github%.com/[%a%d%-%_%.]+%/?$"] = {
    --- github.com/<user>

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },
  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/?$"] = {
    --- github.com/<user>/<repo>

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },
  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/tree/[%a%d%-%_%.]+%/?$"] = {
    --- github.com/<user>/<repo>/tree/<branch>

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },
  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+/commits/[%a%d%-%_%.]+%/?$"] = {
    --- github.com/<user>/<repo>/commits/<branch>

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },

  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/releases$"] = {
    --- github.com/<user>/<repo>/releases

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },
  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/tags$"] = {
    --- github.com/<user>/<repo>/tags

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },
  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/issues$"] = {
    --- github.com/<user>/<repo>/issues

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },
  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/pulls$"] = {
    --- github.com/<user>/<repo>/pulls

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },

  ["github%.com/[%a%d%-%_%.]+/[%a%d%-%_%.]+%/wiki$"] = {
    --- github.com/<user>/<repo>/wiki

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },

  ["developer%.mozilla%.org"] = {
    priority = -9999,

    icon = "󰖟 ",
    hl = "MarkviewPalette5Fg",
  },

  ["w3schools%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette4Fg",
  },

  ["stackoverflow%.com"] = {
    priority = -9999,

    icon = "󰓌 ",
    hl = "MarkviewPalette2Fg",
  },

  ["reddit%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette2Fg",
  },

  ["github%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },

  ["gitlab%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette2Fg",
  },

  ["dev%.to"] = {
    priority = -9999,

    icon = "󱁴 ",
    hl = "MarkviewPalette0Fg",
  },

  ["codepen%.io"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette6Fg",
  },

  ["replit%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette2Fg",
  },

  ["jsfiddle%.net"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette5Fg",
  },

  ["npmjs%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette0Fg",
  },

  ["pypi%.org"] = {
    priority = -9999,

    icon = "󰆦 ",
    hl = "MarkviewPalette0Fg",
  },

  ["mvnrepository%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette1Fg",
  },

  ["medium%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette6Fg",
  },

  ["linkedin%.com"] = {
    priority = -9999,

    icon = "󰌻 ",
    hl = "MarkviewPalette5Fg",
  },

  ["news%.ycombinator%.com"] = {
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette2Fg",
  },
  ["arxiv%.org/abs/[%a%d%-%_%.]+$"] = {
    --- arxiv.org/abs/<id>
    priority = -9999,

    icon = " ",
    hl = "MarkviewPalette6Fg",
  },
}

return {
  -- Markdown preview with markview
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "Avante" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>mp", "<cmd>Markview<cr>", desc = "切换Markdown预览", ft = "markdown" },
    },
    config = function()
      local presets = require("markview.presets")

      require("markview").setup({
        markdown_inline = {
          enable = true,
          checkboxes = presets.checkboxes.nerd,
          hyperlinks = reference_definitions,
        },
        markdown = {
          enable = true,
          headings = presets.headings.glow,
          tables = presets.tables.rounded,
          code_blocks = { sign = false, min_width = 80 },
        },
      })
    end,
  },
  -- Browser-based markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      { "<leader>mv", "<cmd>MarkdownPreviewToggle<cr>", desc = "浏览器Markdown预览", ft = "markdown" },
    },
    config = function()
      -- Settings
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ""
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ""
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
      }
      vim.g.mkdp_markdown_css = ""
      vim.g.mkdp_highlight_css = ""
      vim.g.mkdp_port = ""
      vim.g.mkdp_page_title = "「${name}」"
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
