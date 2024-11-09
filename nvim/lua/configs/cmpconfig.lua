-- cmp-config.lua

-- Import necessary modules
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind') -- For adding icons to completion items

-- Load friendly-snippets or your preferred snippet collection
require("luasnip.loaders.from_vscode").lazy_load()

-- Configure nvim-cmp
cmp.setup({
  -- Enable snippet support
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users
    end,
  },

  -- Configure window appearance
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:None,FloatBorder:None,CursorLine:PmenuSel,Search:None",
      scrollbar = false, -- Disable scrollbar
      -- Additional window options can be added here
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:None,FloatBorder:None",
      scrollbar = false, -- Disable scrollbar
      -- You can set a max width for the documentation window if desired
      -- max_width = 60,
    }),
  },

  -- Configure key mappings
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll docs down
    ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
    ['<C-e>'] = cmp.mapping.abort(),         -- Close completion window
    ['<CR>'] = cmp.mapping.confirm({         -- Confirm selection
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),

    -- Navigate through completion items
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback() -- Insert a tab character
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback() -- Insert a shift-tab character
      end
    end, { 'i', 's' }),
  }),

  -- Configure completion sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },         -- LSP-based completions
    { name = 'luasnip' },          -- Snippets
    { name = 'path' },             -- File paths
    { name = 'buffer', keyword_length = 3 }, -- Buffer words, trigger after 3 chars
    { name = 'nvim_lua' },         -- Neovim Lua API
  }, {
    { name = 'emoji' },            -- Emoji completions
  }),

  -- Configure formatting with icons and additional information
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- Show symbol and text
      maxwidth = 50,        -- Prevent the popup from exceeding 50 characters
      ellipsis_char = '...', -- Show ellipsis if truncated
      before = function(entry, vim_item)
        -- You can add more customization here if needed
        return vim_item
      end,
    }),
  },

  -- Configure experimental features
  experimental = {
    ghost_text = {
      hl_group = 'LspCodeLens', -- Highlight group for ghost text
    },
    native_menu = false,
  },
  
  -- Configure sorting behavior
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require('cmp-under-comparator').under, -- Custom comparator for underscores
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- Use buffer source for '/' and '?' in command-line mode
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' in command-line mode
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

