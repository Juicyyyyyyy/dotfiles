local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

local lspconfig = require "lspconfig"

-- Add clangd for C/C++ support
local servers = { "html", "cssls", "clangd" }

-- LSPs with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      -- Custom on_attach logic here
    end,
    capabilities = capabilities,  -- Updated capabilities
  }
end

