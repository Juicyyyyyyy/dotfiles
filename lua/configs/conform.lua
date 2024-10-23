local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
    h = { "clang_format" },
    cpp = { "clang_format" },
    -- Add more filetypes as needed
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true, -- Use LSP if no formatter is available
  },
}

return options

