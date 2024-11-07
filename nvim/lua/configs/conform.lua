local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
    h = { "clang_format" },
    cpp = { "clang_format" },
    -- Add more filetypes as needed
  },

  format_on_save = {
    timeout_ms = 300,  -- Shorter timeout
    lsp_fallback = true,
    debounce_ms = 100,  -- Prevent multiple format calls in quick succession
  },
}

return options

