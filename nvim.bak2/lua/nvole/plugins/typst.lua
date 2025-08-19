return {
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = false,
    },
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "0.3.*",
        build = function() require("typst-preview").update() end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "niuiic/typst-preview.nvim",
        ft = "typst",
        dependencies = { "niuiic/core.nvim" },
        config = function()
            require("typst-preview").setup({
                -- 直接编译为PDF并用外部查看器打开
                preview_method = "pdf", -- 使用PDF而不是web预览
                
                -- PDF查看器设置
                pdf_viewer = "sioyek", -- 或者 "skim", "okular", "zathura" 等
                
                -- 编译选项
                compiler_args = {
                    "--root", ".",
                },
                
                -- 自动编译设置
                auto_compile = true,
                auto_preview = false, -- 不自动打开，手动控制
            })
            
            -- 为Typst文件启用自动保存和PDF编译
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "typst",
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()
                    
                    -- 编译相关快捷键
                    vim.keymap.set("n", "<localleader>ll", function()
                        vim.cmd("write")
                        -- 直接使用typst命令编译为PDF
                        local filename = vim.fn.expand("%:r")
                        vim.cmd("!typst compile " .. vim.fn.shellescape(vim.fn.expand("%")) .. " " .. vim.fn.shellescape(filename .. ".pdf"))
                    end, { buffer = true, desc = "Save and compile Typst to PDF" })
                    
                    vim.keymap.set("n", "<localleader>lv", function()
                        vim.cmd("write")
                        local filename = vim.fn.expand("%:r")
                        -- 编译并打开PDF
                        vim.cmd("!typst compile " .. vim.fn.shellescape(vim.fn.expand("%")) .. " " .. vim.fn.shellescape(filename .. ".pdf") .. " && open " .. vim.fn.shellescape(filename .. ".pdf"))
                    end, { buffer = true, desc = "Compile and view PDF" })
                    
                    vim.keymap.set("n", "<localleader>lw", function()
                        vim.cmd("write")
                        -- 使用watch模式实时编译
                        local filename = vim.fn.expand("%:r")
                        vim.cmd("!typst watch " .. vim.fn.shellescape(vim.fn.expand("%")) .. " " .. vim.fn.shellescape(filename .. ".pdf") .. " &")
                    end, { buffer = true, desc = "Start Typst watch mode" })
                    
                    vim.keymap.set("n", "<localleader>lp", function()
                        vim.cmd("write")
                        local filename = vim.fn.expand("%:r")
                        local pdf_path = filename .. ".pdf"
                        
                        -- 先编译PDF
                        local compile_result = vim.fn.system("typst compile " .. vim.fn.shellescape(vim.fn.expand("%")) .. " " .. vim.fn.shellescape(pdf_path))
                        
                        -- 检查PDF是否存在
                        if vim.fn.filereadable(pdf_path) == 1 then
                            -- 在垂直分割中打开PDF
                            vim.cmd("vsplit " .. vim.fn.fnameescape(pdf_path))
                        else
                            vim.notify("PDF compilation failed: " .. compile_result, vim.log.levels.ERROR)
                        end
                    end, { buffer = true, desc = "Preview PDF in split" })
                    
                    vim.keymap.set("n", "<localleader>lt", function()
                        vim.cmd("write")
                        local filename = vim.fn.expand("%:r")
                        local pdf_path = filename .. ".pdf"
                        
                        -- 先编译PDF
                        vim.fn.system("typst compile " .. vim.fn.shellescape(vim.fn.expand("%")) .. " " .. vim.fn.shellescape(pdf_path))
                        
                        -- 检查PDF是否存在
                        if vim.fn.filereadable(pdf_path) == 1 then
                            -- 在新标签页中打开PDF
                            vim.cmd("tabnew " .. vim.fn.fnameescape(pdf_path))
                        else
                            vim.notify("PDF compilation failed", vim.log.levels.ERROR)
                        end
                    end, { buffer = true, desc = "Preview PDF in new tab" })
                    
                    vim.keymap.set("n", "<localleader>lh", function()
                        vim.cmd("write")
                        -- 启动网页预览模式
                        vim.cmd("TypstPreview")
                    end, { buffer = true, desc = "Start web preview" })
                    
                    vim.keymap.set("n", "<localleader>ls", function()
                        -- 停止网页预览
                        vim.cmd("TypstPreviewStop")
                    end, { buffer = true, desc = "Stop web preview" })
                    
                    -- 启用自动保存
                    vim.opt_local.autowrite = true
                    vim.opt_local.autowriteall = true
                    
                    -- 自动保存并编译（可选）
                    local timer = nil
                    vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
                        buffer = buf,
                        callback = function()
                            if vim.bo[buf].modified then
                                vim.cmd("silent! write")
                                
                                -- 防抖编译：500ms后如果没有新的改动才编译
                                if timer then
                                    vim.fn.timer_stop(timer)
                                end
                                timer = vim.fn.timer_start(500, function()
                                    local filename = vim.fn.expand("%:r")
                                    vim.fn.system("typst compile " .. vim.fn.shellescape(vim.fn.expand("%")) .. " " .. vim.fn.shellescape(filename .. ".pdf"))
                                end)
                            end
                        end,
                    })
                end,
            })
        end,
    }
}