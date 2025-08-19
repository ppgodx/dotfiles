local M = {}

vim.g.neovide_input_ime = false

function M.set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

return M
