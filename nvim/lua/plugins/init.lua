return {

	-- Dashboard configuration
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
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
		build = ':TSUpdate',
		opts = {
			ensure_installed = { "c", "cpp", "lua", "vim", "html", "css" },
			highlight = { enable = true },
		},
	},

	-- **nvim-cmp**: Autocompletion plugin with snippet support
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets'
		},
		config = function()
			require "configs.cmpconfig"
		end,
	},

	-- **nvim-tree**: File explorer
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require 'nvim-tree'.setup {
				git = { enable = true, ignore = false, timeout = 500 },
				view = { width = 30, side = "left" },
				renderer = {
					highlight_git = true,
					icons = { show = { git = true } },
				},
			}
		end,
	},

	-- **Telescope**: Fuzzy finder and picker
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { 'nvim-lua/plenary.nvim' } },
	},

	-- **lsp_signature.nvim**: Display function signatures
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require 'lsp_signature'.setup()
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
			require 'nvim-web-devicons'.setup { default = true, }
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
			auto_restore_enabled = false,
			suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		},
	},

	-- **image.nvim**: Automatically display images
	{
		"3rd/image.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("image").setup({
				backend = "kitty",
				integrations = {
					markdown = { enabled = true, download_remote_images = true },
					neorg = { enabled = true, download_remote_images = true },
				},
			})
		end,
	},

	-- **nvim-autopairs**: Automatically close brackets, quotes, etc.
	{
		'windwp/nvim-autopairs',
		config = function()
			local npairs = require("nvim-autopairs")
			npairs.setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- **Mason.nvim**: LSP and more installation manager
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
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
				ensure_installed = { "clangd", "lua_ls" },
				automatic_installation = true,
			})
		end,
	},

	-- **nvim-lspconfig**: Quickstart configurations for LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("configs.lsp")
		end,
	},

	-- **lspsaga.nvim**: Enhanced LSP UI
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				ui = {
					theme = 'round',
					border = 'rounded',
					winblend = 10,
				},
				lightbulb = {
					enable = true,
					enable_in_insert = false,
				},
				finder = {
					max_height = 0.5,
				},
				outline = {
					win_position = "right",
					win_width = 30,
					auto_preview = true,
				},
				symbol_in_winbar = {
					enable = true,
					separator = "  ",
				},
				rename = {
					in_select = false,
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- **lsp_lines.nvim**: Inline diagnostics
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},

	unpack(require("themes")),
}
