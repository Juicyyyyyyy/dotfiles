-- LSP Configuration

-- Import necessary modules
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Setup capabilities for enhanced completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Function to setup diagnostic signs with icons
local function setup_diagnostic_signs()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

setup_diagnostic_signs()

-- on_attach function to map keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

end

-- List of LSP servers to install and configure
local servers = { 'clangd', 'pylsp', 'lua_ls' } -- Add or remove servers as needed

-- Ensure the servers are installed
mason_lspconfig.setup {
  ensure_installed = servers,
}

-- Setup each server with the appropriate settings
for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Server-specific configurations
  if server == 'clangd' then
    opts.cmd = { "clangd", "--compile-commands-dir=build" }
  elseif server == 'lua_ls' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    }
  end

  lspconfig[server].setup(opts)
end

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true, -- Requires the 'lsp_lines' plugin
  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
})

-- Show diagnostics in a floating window on hover
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
