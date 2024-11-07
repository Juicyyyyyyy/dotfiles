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

  -- **nvim-tree**: File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require'nvim-tree'.setup {
        git = {
          enable = true,  -- Enable git integration
          ignore = false, -- Show ignored files
          timeout = 500,  -- Set the timeout for git status (in milliseconds)
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          highlight_git = true, -- Enable git highlighting in the file explorer
          icons = {
            show = {
              git = true,  -- Show git icons next to files and folders
            },
          },
        },
      }
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
  
  -- **nvim-autopairs**: Automatically close brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})

      -- Optional integration with nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

-- **Mason.nvim**: LSP and more installation manager
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- Optional: Update Mason packages after installation
  config = function()
    require("mason").setup()
  end,
},

-- **mason-lspconfig.nvim**: Bridges Mason with lspconfig
{
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "lua_ls" }, -- Install LSP servers for C and Lua
      automatic_installation = true,
    })
  end,
},

-- **nvim-lspconfig**: Quickstart configurations for the Nvim LSP client
{
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("configs.lsp")
  end,
},

  unpack(require("themes")),
}

