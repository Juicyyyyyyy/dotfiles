return {
  -- **Kanagawa Theme**: A beautiful theme for Neovim
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        -- You can add Kanagawa-specific configurations here
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
  
  -- **Cyberdream Theme**
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme cyberdream")
    end,
  },
  
  -- **Miasma Theme**
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },

  -- **Dracula Theme**: A popular dark theme with vibrant colors
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  },

  -- **Rose Pine Theme**: A soothing theme with soft colors
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        -- You can add Rose Pine-specific configurations here
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },

  -- **Tokyonight Theme**: A modern theme inspired by Tokyo city lights
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm", -- Options: storm, night, day
        -- You can add Tokyonight-specific configurations here
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- **Nightfox Theme**: A bright and dark theme with multiple variants
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          -- Fox styles
          fox = "nightfox", -- other options: dawnfox, duskfox, etc.
        },
      })
      vim.cmd("colorscheme nightfox")
    end,
  },

  -- **Nord Theme**: A cool and calm theme inspired by the arctic
  {
    "shaunsingh/nord.nvim",
    config = function()
      require("nord").set()
      vim.cmd("colorscheme nord")
    end,
  },

  -- **One Dark Theme**: A sleek theme based on Atom's One Dark
  {
    "joshdick/onedark.vim",
    config = function()
      vim.cmd("colorscheme onedark")
    end,
  },

  -- **Gruvbox Theme**: A retro groove color scheme for Neovim
  {
    "morhetz/gruvbox",
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- **Material Theme**: A material design-inspired theme
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        -- You can add Material-specific configurations here
      })
      vim.cmd("colorscheme material")
    end,
  },

  -- **Everforest Theme**: A lush green theme inspired by nature
  {
    "sainnhe/everforest",
    config = function()
      vim.cmd("colorscheme everforest")
    end,
  },
  
  -- **Catppuccin Theme**: A customizable theme with soft colors and high contrast
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        -- You can add Catppuccin-specific configurations here
      })
      vim.cmd("colorscheme catppuccin")
    end,
  },
{
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}
}

