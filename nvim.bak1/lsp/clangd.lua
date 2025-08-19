return {
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { "utf-16" },
  },
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
  },
  single_file_support = true,
}
