  require('bufferline').setup {
    options = {
      numbers = "buffer_id", -- Display buffer numbers
      close_command = "bdelete! %d", -- Command to close buffer
      right_mouse_command = "bdelete! %d", -- Command on right-click
      left_mouse_command = "buffer %d", -- Command on left-click
      middle_mouse_command = nil, -- No action on middle-click
      indicator_icon = '▎',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      show_buffer_icons = true, -- Enable filetype icons
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "slant", -- Options: "slant", "padded_slant", "thick", "thin", etc.
      enforce_regular_tabs = false,
      always_show_bufferline = true,
    },
  }

