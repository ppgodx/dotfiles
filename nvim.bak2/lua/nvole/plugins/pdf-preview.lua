return {
    "makerj/vim-pdf",
    ft = "pdf",
    config = function()
        -- PDF预览设置
        vim.g.pdf_convert_on_read = 1
        vim.g.pdf_convert_on_edit = 1
    end,
}