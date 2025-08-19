vim.lsp.set_log_level("OFF")

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")

vim.api.nvim_create_user_command("LspInfo", ":checkhealth vim.lsp", { desc = "Alias to `:checkhealth vim.lsp`" })

vim.api.nvim_create_user_command("LspRestart", function()
  vim.lsp.stop_client(vim.lsp.get_clients())
  vim.cmd("edit")
end, { desc = "Restart all LSP clients and reload buffer" })

vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- stylua: ignore
		vim.keymap.set( "n", "gd", require("telescope.builtin").lsp_definitions, { buffer = args.buf, desc = "LSP: Go to definition" })

    -- stylua: ignore
		vim.keymap.set( "n", "gr", require("telescope.builtin").lsp_references, { buffer = args.buf, desc = "LSP: Go to references" })

    -- stylua: ignore
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename Symbol" })

    if client and client:supports_method("textDocument/foldingRange", args.buf) then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})

local icons = require("global.ui.icons")

vim.diagnostic.config({
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = {
    prefix = " ",
    spacing = 5,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
    },
  },
})
