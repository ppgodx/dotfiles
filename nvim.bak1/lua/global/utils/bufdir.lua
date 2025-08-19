local M = {}

function M.current_bufdir()
  local path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  return vim.fn.fnamemodify(path, ":p:h")
end

return M
