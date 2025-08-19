return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  keys = {
    { "<leader>ae", "<cmd>Copilot enable<cr>", desc = "Enable Copilot" },
    { "<leader>ad", "<cmd>Copilot disable<cr>", desc = "Disable Copilot" },
    { "<leader>as", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
  },
}
