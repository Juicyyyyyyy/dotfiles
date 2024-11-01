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

  error_display = {
    limit = 5, -- Limit the number of error messages displayed
    show_in_popup = true, -- Display errors in a popup
    notify = true, -- Send a notification instead of showing errors in a buffer
  }
}

-- Optional: Enhance error notifications with `vim.notify`
vim.notify = function(msg, level)
  vim.api.nvim_echo({{ msg, level }}, true, {})
end

return options

