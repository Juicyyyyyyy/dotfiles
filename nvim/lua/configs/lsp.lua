local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Set up LSP servers installed via Mason
mason_lspconfig.setup_handlers({
  function(server_name)
    if server_name == "clangd" then
      lspconfig.clangd.setup({
        on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

          -- Define key mappings
          local opts = { noremap = true, silent = true }
          local buf_set_keymap = vim.api.nvim_buf_set_keymap
        end,
        flags = {
          debounce_text_changes = 150,
        },
        cmd = { "clangd", "--compile-commands-dir=build" },  -- Adjust if compile_commands.json is elsewhere
        settings = {
          ["clangd"] = {
            arguments = {
              "-std=c99",
              "-pedantic",
              "-Werror",
              "-Wall",
              "-Wextra",
              "-Wvla",
            },
          },
        },
      })
    else
      lspconfig[server_name].setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
        flags = {
          debounce_text_changes = 150,
        },
      })
    end
  end,
})

