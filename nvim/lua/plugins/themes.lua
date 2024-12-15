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
{
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}

}


