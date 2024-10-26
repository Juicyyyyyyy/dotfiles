return {

 -- Dashboard configuration
  {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },  -- For file icons
  config = function()
    require('configs.dashboard')
  end,
  },

  
  -- **Conform.nvim**: Format code on save
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },

  -- **Neovim LSP Configuration**
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- **nvim-treesitter**: Enhanced syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',  -- Runs ':TSUpdate' after installation
    opts = {
      ensure_installed = { "c", "cpp", "lua", "vim", "html", "css" },
      highlight = { enable = true },
    },
  },

  -- **nvim-cmp**: Autocompletion plugin with snippet support
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',        -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',          -- Buffer source
      'hrsh7th/cmp-path',            -- Path source
      'saadparwaiz1/cmp_luasnip',    -- Snippet completions
      'L3MON4D3/LuaSnip',            -- Snippet engine
      'rafamadriz/friendly-snippets' -- Collection of snippets
    },
    config = function()
      require "configs.cmpconfig"
    end,
  },

  -- **ALE**: Asynchronous linting and fixing
  {
    "dense-analysis/ale",
    config = function()
      vim.g.ale_linters = { c = { 'clang', 'gcc' } }
      vim.g.ale_fixers = { c = { 'clang-format' } }
    end,
  },

  -- **Debugging with nvim-dap and extensions**
  {
    "mfussenegger/nvim-dap",  -- Debug Adapter Protocol client
  },
  {
    "rcarriga/nvim-dap-ui",   -- UI enhancements for nvim-dap
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui
    },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text", -- Show virtual text for variables
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- **nvim-tree**: File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require'nvim-tree'.setup {}
    end,
  },

  -- **Telescope**: Fuzzy finder and picker
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { {'nvim-lua/plenary.nvim'} },  -- Common utilities
  },

  -- **lsp_signature.nvim**: Display function signatures
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require'lsp_signature'.setup()
    end,
  },

  -- **null-ls.nvim**: Use external tools with LSP features
  {
    "jose-elias-alvarez/null-ls.nvim",
  },

  -- **lspkind-nvim**: Adds icons to completion items
  {
    "onsails/lspkind-nvim",
    config = function()
      require('lspkind').init()
    end,
  },

  -- **gitsigns.nvim**: Git integration for buffers
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  },
  
  -- Which-key plugin for displaying keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.whichkey") 
    end,
  },
  
  -- Bufferline plugin for tabbar
{
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('configs.bufferline')
  end,
},

  
  -- **nvim-web-devicons**: Icons for files and more
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require'nvim-web-devicons'.setup { default = true; }
    end,
  },
  
  -- **Project management**: Automatically manage project settings
  {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {}
  end,
  },
  
  -- **Status line**: Configure Lualine as a status line
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("configs.lualine")
  end,
  },
  
  -- **Auto session management**: Save and restore sessions automatically
  {
  'rmagatti/auto-session',
  lazy = false,
  opts = {
    auto_session_enable_last_session = false,
    auto_restore_enabled = false,  -- Disable automatic session restoration
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
},
  
  -- **Themes**: Import themes from themes.lua
  unpack(require("themes")),
}
