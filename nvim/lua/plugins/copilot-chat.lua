return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.8, -- fractional height of parent, or absolute height in rows when > 1
        -- row = nil, -- row position of the window, default is centered
        -- col = nil, -- column position of the window, default is centered
        relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
        border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        title = "Copilot Chat", -- title of the window
        footer = nil, -- footer of the window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
      prompts = {
        -- Code related prompts
        Explain = "请用中文详细解释以下代码的工作原理和功能。",
        Review = "请用中文审查以下代码并提供改进建议。",
        Tests = "请先用中文解释代码功能，然后为其生成单元测试。",
        Refactor = "请重构以下代码以提高其清晰度和可读性，并用中文说明原因。",
        FixCode = "请修复以下代码使其正常工作，并用中文解释修改内容。",
        FixError = "请用中文解释以下错误并提供解决方案。",
        BetterNamings = "请为以下变量和函数提供更好的命名建议，用中文解释。",
        Documentation = "请为以下代码提供中文文档。",
        SwaggerApiDocs = "请使用Swagger为以下API提供中文文档。",
        SwaggerJSDoc = "请使用Swagger为以下API编写JSDoc，注释用中文。",
        -- Text related prompts
        Summarize = "请总结以下文本内容。",
        Spelling = "请修正以下文本中的语法和拼写错误。",
        Wording = "请改善以下文本的语法和措辞。",
        Concise = "请将以下文本重写得更加简洁。",
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      -- Use unnamed register for the selection
      opts.selection = select.unnamed

      -- Override the git prompts message
      opts.prompts.Commit = {
        prompt = "Write commit message for the change with commitizen convention",
        selection = select.gitdiff,
      }
      opts.prompts.CommitStaged = {
        prompt = "Write commit message for the change with commitizen convention",
        selection = function(source)
          return select.gitdiff(source, true)
        end,
      }

      chat.setup(opts)

      -- Setup the CMP integration
      require("CopilotChat.integrations.cmp").setup()

      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Inline chat with Copilot
      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*" })

      -- Custom buffer for CopilotChat
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true

          -- Get current filetype and set it to markdown if the current filetype is copilot-chat
          local ft = vim.bo.filetype
          if ft == "copilot-chat" then
            vim.bo.filetype = "markdown"
          end
        end,
      })
    end,
    event = "VeryLazy",
    keys = {
      -- Show help actions with telescope
      {
        "<leader>cch",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "Copilot对话 - 帮助菜单",
      },
      -- Show prompts actions with telescope
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "Copilot对话 - 提示菜单",
      },
      {
        "<leader>ccp",
        ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
        mode = "x",
        desc = "Copilot对话 - 可视模式提示菜单",
      },
      -- Code related commands
      { "<leader>cce", function()
        vim.cmd("CopilotChat 请用中文解释这段代码的功能和工作原理")
      end, desc = "Copilot对话 - 解释代码" },
      { "<leader>cct", function()
        vim.cmd("CopilotChat 请为这段代码生成单元测试，并用中文注释")
      end, desc = "Copilot对话 - 生成测试" },
      { "<leader>ccr", function()
        vim.cmd("CopilotChat 请审查这段代码，用中文给出改进建议")
      end, desc = "Copilot对话 - 代码审查" },
      { "<leader>ccR", function()
        vim.cmd("CopilotChat 请重构这段代码以提高可读性和性能，用中文说明改动原因")
      end, desc = "Copilot对话 - 重构代码" },
      { "<leader>ccn", function()
        vim.cmd("CopilotChat 请为这段代码中的变量和函数提供更好的命名建议，用中文解释")
      end, desc = "Copilot对话 - 优化命名" },
      -- Chat with Copilot in visual mode
      { "<leader>ccV", ":CopilotChatVisual 请用中文", mode = "x", desc = "Copilot对话 - 可视模式对话" },
      { "<leader>ccx", ":CopilotChatInline 请用中文<cr>", mode = "x", desc = "Copilot对话 - 内联聊天" },
      -- Custom input for CopilotChat
      { "<leader>cci", function()
        local input = vim.fn.input("问Copilot: ")
        if input ~= "" then
          vim.cmd("CopilotChat " .. input)
        end
      end, desc = "Copilot对话 - 自定义提问" },
      -- Generate commit message based on the git diff
      { "<leader>ccm", function()
        vim.cmd("CopilotChat 请为这些更改生成一个规范的commit消息，用中文描述")
      end, desc = "Copilot对话 - 生成提交消息" },
      { "<leader>ccM", function()
        vim.cmd("CopilotChatCommitStaged 请为已暂存的更改生成commit消息，用中文描述")
      end, desc = "Copilot对话 - 暂存区提交消息" },
      -- Quick chat with Copilot
      { "<leader>ccq", function()
        local input = vim.fn.input("快速聊天: ")
        if input ~= "" then
          vim.cmd("CopilotChatBuffer " .. input)
        end
      end, desc = "Copilot对话 - 快速聊天" },
      -- Debug
      { "<leader>ccd", "<cmd>CopilotChatDebugInfo<cr>", desc = "Copilot对话 - 调试信息" },
      -- Fix the issue with diagnostic
      { "<leader>ccf", function()
        vim.cmd("CopilotChat 请帮我修复这个诊断错误，用中文解释解决方案")
      end, desc = "Copilot对话 - 修复诊断错误" },
      -- Clear buffer and chat history
      { "<leader>ccl", "<cmd>CopilotChatReset<cr>", desc = "Copilot对话 - 清除历史" },
      -- Toggle Copilot Chat Vsplit
      { "<leader>ccv", "<cmd>CopilotChatToggle<cr>", desc = "Copilot对话 - 切换窗口" },
      -- Copilot Chat Models
      { "<leader>cc?", "<cmd>CopilotChatModels<cr>", desc = "Copilot对话 - 选择模型" },
      -- Resize CopilotChat window
      { "<leader>ccr", function()
        local current_config = require("CopilotChat").config.window
        local choices = {
          "小窗口 (30% x 60%)",
          "默认窗口 (50% x 80%)",
          "大窗口 (70% x 90%)",
          "全屏窗口 (90% x 95%)",
          "浮动窗口 (80列 x 20行)",
          "水平分割 (100% x 30%)",
          "垂直分割 (40% x 100%)"
        }
        
        vim.ui.select(choices, {
          prompt = "选择 CopilotChat 窗口大小:",
          kind = "copilot_chat_resize"
        }, function(choice, idx)
          if not choice then return end
          
          local new_config = {}
          if idx == 1 then -- 小窗口
            new_config = { layout = "vertical", width = 0.3, height = 0.6, relative = "editor", border = "single" }
          elseif idx == 2 then -- 默认窗口
            new_config = { layout = "vertical", width = 0.5, height = 0.8, relative = "editor", border = "single" }
          elseif idx == 3 then -- 大窗口
            new_config = { layout = "vertical", width = 0.7, height = 0.9, relative = "editor", border = "single" }
          elseif idx == 4 then -- 全屏窗口
            new_config = { layout = "vertical", width = 0.9, height = 0.95, relative = "editor", border = "single" }
          elseif idx == 5 then -- 浮动窗口
            new_config = { layout = "float", width = 80, height = 20, relative = "editor", border = "rounded" }
          elseif idx == 6 then -- 水平分割
            new_config = { layout = "horizontal", width = 1.0, height = 0.3, relative = "editor", border = "single" }
          elseif idx == 7 then -- 垂直分割
            new_config = { layout = "vertical", width = 0.4, height = 1.0, relative = "editor", border = "single" }
          end
          
          -- 更新配置
          local chat = require("CopilotChat")
          chat.config.window = vim.tbl_deep_extend("force", chat.config.window, new_config)
          
          -- 如果窗口已经打开，关闭并重新打开
          if chat.buf and vim.api.nvim_buf_is_valid(chat.buf) then
            chat.close()
            vim.defer_fn(function()
              chat.open()
            end, 100)
          end
          
          vim.notify("CopilotChat 窗口大小已更新: " .. choice, vim.log.levels.INFO)
        end)
      end, desc = "Copilot对话 - 调整窗口大小" },
    },
  },
}