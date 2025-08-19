return {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
        -- Copilot基本设置
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_tab_fallback = ""
        
        -- 设置Copilot在特定文件类型中禁用
        vim.g.copilot_filetypes = {
            ["*"] = true,
            ["gitcommit"] = false,
            ["gitrebase"] = false,
            ["hgcommit"] = false,
            ["svn"] = false,
            ["cvs"] = false,
            [".env"] = false,
        }
        
        -- 自定义快捷键
        local keymap = vim.keymap.set
        
        -- 接受建议
        keymap("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false,
            desc = "Accept Copilot suggestion"
        })
        
        -- 下一个建议
        keymap("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
        
        -- 上一个建议
        keymap("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
        
        -- 拒绝建议
        keymap("i", "<C-c>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
        
        -- 手动触发建议
        keymap("i", "<C-\\>", "<Plug>(copilot-suggest)", { desc = "Trigger Copilot suggestion" })
    end,
}