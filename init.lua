-- Set leader key
vim.g.mapleader = " "

-- Unmap space in normal and visual modes to prevent it from moving the cursor
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Bootstrap lazy.nvim and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from plugins/init.lua
local plugins = require("plugins.init")

-- Setup lazy.nvim with the imported plugins
require("lazy").setup(plugins)

-- Load Neovim options (create your own options module)
require("options")

-- Load key mappings (create your own mappings module)
vim.schedule(function()
  require("mappings")
end)

-- Set default theme
vim.cmd("colorscheme kanagawa")

vim.cmd([[
  highlight DashboardHeader guifg=#7E9CD8 ctermfg=75
  highlight DashboardButtons guifg=#A3D4D5 ctermfg=152
  highlight DashboardFooterBold guifg=#ff9e64 gui=bold
]])
