return {
  {
    "L3MON4D3/LuaSnip",
    build = (function()
      -- Build Step is needed for regex support in snippets.
      -- This step is not supported in many windows environments.
      -- Remove the below condition to re-enable on windows.
      if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
        return
      end
      return "make install_jsregexp"
    end)(),
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts)

      -- Load custom snippets
      require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })

      -- Key mappings for LuaSnip
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true, desc = "展开或跳转到下一个snippet节点" })

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true, desc = "跳转到上一个snippet节点" })

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true, desc = "切换选择项" })

      -- Reload snippets command
      vim.api.nvim_create_user_command("LuaSnipEdit", function()
        require("luasnip.loaders").edit_snippet_files()
      end, { desc = "编辑snippets文件" })
    end,
  },
}