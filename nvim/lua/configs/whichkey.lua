-- Aesthetic configuration for which-key
require("which-key").setup {
  preset = "modern",  -- Choose a preset layout for a sleek appearance

  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,

  filter = function(mapping)
    return true
  end,

  spec = {},

  notify = true,

  triggers = {
    { "<auto>", mode = "nxso" },
  },

  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,

  plugins = {
    marks = true,     -- Show marks on `'` and ```
    registers = true, -- Show registers on `"` in NORMAL or `<C-r>` in INSERT mode
    spelling = {
      enabled = true,    -- Enable spelling suggestions
      suggestions = 20,  -- Number of spelling suggestions to show
    },
    presets = {
      operators = true,     -- Help for operators like `d`, `y`, etc.
      motions = true,       -- Help for motions
      text_objects = true,  -- Help for text objects after operators
      windows = true,       -- Default bindings on `<c-w>`
      nav = true,           -- Misc bindings for window navigation
      z = true,             -- Bindings for folds, spelling, etc. prefixed with `z`
      g = true,             -- Bindings prefixed with `g`
    },
  },

  win = {
    no_overlap = true,          -- Prevent popup from overlapping with the cursor
    padding = { 1, 2 },         -- Window padding [top/bottom, right/left]
    title = true,               -- Show title in the popup window
    title_pos = "center",       -- Position of the title
    zindex = 1000,              -- Window z-index
    bo = {},                     -- Additional `vim.bo` options
    wo = {
      -- winblend = 10,          -- Uncomment to set transparency (0-100)
    },
    border = "rounded",          -- Rounded borders for a modern look
  },

  layout = {
    width = { min = 20 },        -- Minimum width of the columns
    spacing = 5,                 -- Spacing between columns for better readability
    align = "left",              -- Align columns to the left
  },

  keys = {
    scroll_down = "<c-d>",       -- Bind `<c-d>` to scroll down in the popup
    scroll_up = "<c-u>",         -- Bind `<c-u>` to scroll up in the popup
  },

  sort = { "local", "order", "group", "alphanum", "mod" }, -- Sorting order of mappings

  expand = 0,                     -- Expand groups when <= 0 mappings

  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
      -- { "<Space>", "SPC" },    -- Example of custom key replacement
    },
    desc = {
      { "<Plug>%(?(.*)%)?", "%1" },
      { "^%+", "" },
      { "<[cC]md>", "" },
      { "<[cC][rR]>", "" },
      { "<[sS]ilent>", "" },
      { "^lua%s+", "" },
      { "^call%s+", "" },
      { "^:%s*", "" },
    },
  },

  icons = {
    breadcrumb = "»",            -- Symbol in the command line area for active key combo
    separator = "➜",             -- Symbol between a key and its label
    group = "+",                 -- Symbol prepended to a group
    ellipsis = "…",              -- Symbol for truncated mappings
    mappings = true,             -- Enable mapping icons
    colors = true,               -- Use colors for icons

    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },

  show_help = true,               -- Show help message in the command line
  show_keys = true,               -- Show the currently pressed key and its label as a message
  disable = {
    ft = {},                      -- Disable for certain file types
    bt = {},                      -- Disable for certain buffer types
  },
  debug = false,                   -- Disable debug logging
}

