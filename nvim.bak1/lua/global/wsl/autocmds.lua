-- toggle full screen
vim.keymap.set("n", "<F11>", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { noremap = true, silent = true })

-- auto switch ime
local ime = require("global.wsl.ime")

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = ime.set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = ime.set_ime,
})
