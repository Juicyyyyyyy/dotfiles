-- Define custom functions for LSP client names and clock
local lsp_client_names = function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients == 0 then
    return ''
  end
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end
  return '  ' .. table.concat(client_names, ', ')
end

local clock = function()
  return ' ' .. os.date('%H:%M')
end

-- Lualine configuration
require('lualine').setup {
  options = {
    theme = 'auto',          -- Automatically use your Neovim colorscheme
    icons_enabled = true,
    globalstatus = true,     -- Enable global status line (Neovim 0.7+)
    component_separators = { left = '', right = '' },
    section_separators   = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree', 'alpha' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        symbols = {
          modified = ' ',    -- Icon for modified files
          readonly = ' ',    -- Icon for read-only files
          unnamed  = '[No Name]',
        },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        colored = true,
      },
      lsp_client_names,
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = { clock },
    lualine_z = {
      { 'progress', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        symbols = {
          modified = ' ',
          readonly = ' ',
          unnamed  = '[No Name]',
        },
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

