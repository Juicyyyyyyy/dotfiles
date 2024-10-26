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
  
  -- **image.nvim**: Automatically display images when opening image files
  {
    "3rd/image.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },  -- Required dependency
    config = function()
      require("image").setup({
        backend = "kitty",  -- Choose your preferred backend: "kitty" or "ueberzugpp"
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- Add other markdown-based filetypes if needed
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false, -- Toggle image visibility when windows overlap
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false, -- Auto show/hide images based on editor focus
        tmux_show_only_in_active_window = false, -- Auto show/hide images in the active Tmux window
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- Automatically render these file types as images
      })

      -- Optional: Automatically load images when opening image files
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
        callback = function()
          vim.cmd("ImageLoad")
        end,
      })
    end,
  },

  -- **Themes**: Import themes from themes.lua
  unpack(require("themes")),
}
