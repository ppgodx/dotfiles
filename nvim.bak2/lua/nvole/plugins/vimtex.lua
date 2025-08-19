return {
    "lervag/vimtex",
    ft = { "tex", "latex", "bib" },
    config = function()
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_syntax_conceal_disable = true
        vim.g.vimtex_quickfix_mode = 0  -- 禁用quickfix窗口自动打开
        vim.g.vimtex_view_method = "sioyek"

        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            out_dir = "output",
            options = {
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }

        vim.g.vimtex_compiler_latexmk_engines = {
            _ = "-xelatex",
        }

        -- 忽略常见的LaTeX警告和信息
        vim.g.vimtex_quickfix_ignore_filters = {
            "Command terminated with space",
            "LaTeX Font Warning: Font shape",
            "Package caption Warning: The option",
            [[Underfull \\hbox (badness [0-9]*) in]],
            "Package enumitem Warning: Negative labelwidth",
            [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in]],
            [[Package caption Warning: Unused \\captionsetup]],
            "Package typearea Warning: Bad type area settings!",
            [[Package fancyhdr Warning: \\headheight is too small]],
            [[Underfull \\hbox (badness [0-9]*) in paragraph at lines]],
            "Package hyperref Warning: Token not allowed in a PDF string",
            [[Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in paragraph at lines]],
            "LaTeX Warning: Reference",
            "LaTeX Warning: Citation",
            "Package babel Warning",
        }

        -- 为LaTeX文件启用自动保存
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {"tex", "latex"},
            callback = function()
                -- 编译前自动保存
                vim.keymap.set("n", "<localleader>ll", "<cmd>w<CR><cmd>VimtexCompile<CR>", 
                    { buffer = true, desc = "Save and compile" })
                
                -- 启用自动保存（在失去焦点或切换buffer时）
                vim.opt_local.autowrite = true
                vim.opt_local.autowriteall = true
                
                -- 可选：在文本改变后一定时间自动保存
                vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
                    buffer = 0,
                    callback = function()
                        if vim.bo.modified then
                            vim.cmd("silent! write")
                        end
                    end,
                })
            end,
        })
    end,
}
