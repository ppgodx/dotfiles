-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.fn.timer_stop(vim.g.alphatimer)
  end,
})
