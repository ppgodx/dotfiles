return {
  "folke/trouble.nvim",
  evnet = "LspsAttach",
  opts = {
    modes = {
      symbols = {
        icons = {
          --- @type trouble.Indent.symbols
          folder_closed = " ",
          folder_open = " ",
          kinds = {
            Array = " ",
            Boolean = " ",
            Class = " ",
            Constant = " ",
            Constructor = " ",
            Enum = " ",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = " ",
            Function = " ",
            Interface = " ",
            Key = " ",
            Method = " ",
            Module = " ",
            Namespace = " ",
            Null = " ",
            Number = " ",
            Object = " ",
            Operator = " ",
            Package = " ",
            Property = " ",
            String = " ",
            Struct = " ",
            TypeParameter = " ",
            Variable = " ",
          },
        },
        win = { position = "right", size = 0.25 },
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>cs",
      -- require("trouble").toggle({ mode = "symbols" }),
      "<cmd>Trouble symbols toggle<cr>",
      desc = "List Symbols",
    },
  },
}
