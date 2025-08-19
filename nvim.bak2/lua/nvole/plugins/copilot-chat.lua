return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            debug = true, -- Enable debugging
        },
        config = function(_, opts)
            local chat = require("CopilotChat")
            chat.setup(opts)
            
            -- 快捷键设置
            local keymap = vim.keymap.set
            
            -- 打开 Copilot Chat
            keymap("n", "<leader>cc", "<cmd>CopilotChat<cr>", { desc = "Copilot Chat" })
            keymap("v", "<leader>cc", "<cmd>CopilotChat<cr>", { desc = "Copilot Chat" })
            
            -- 快速操作
            keymap("n", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Copilot Explain" })
            keymap("n", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Copilot Review" })
            keymap("n", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "Copilot Fix" })
            keymap("n", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Copilot Optimize" })
            keymap("n", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Copilot Docs" })
            keymap("n", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Copilot Tests" })
            
            -- 可视模式下的快捷键
            keymap("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Copilot Explain" })
            keymap("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Copilot Review" })
            keymap("v", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "Copilot Fix" })
            keymap("v", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Copilot Optimize" })
            keymap("v", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Copilot Docs" })
            keymap("v", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Copilot Tests" })
        end,
    },
}